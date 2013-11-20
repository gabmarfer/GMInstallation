//
//  GMInstallation.m
//
//
//  Created by Gabi Martelo on 17/11/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import "GMInstallation.h"
#import "SSKeychain.h"

@implementation GMInstallation

/**
 * Generate or load from KeyChain a new uniqueID and save to disk (PrefKey)
 *
 * @param prefKeyName A NSString with the PrefKey name that will be used to store the unique identifier
 * @return
 */
+ (void)generateOrLoadUUIDForPreKey:(NSString *)prefKeyName
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // Try to get it from KeyChain
    NSString *UUID = [userDefaults objectForKey:prefKeyName];
    
    // If no value, try to get from Keychain
    if (![UUID length] > 0)
    {
        UUID = [SSKeychain passwordForService:[[NSBundle mainBundle] bundleIdentifier] account:@"user"];
        if ([UUID length] > 0)
            [userDefaults setObject:UUID forKey:prefKeyName];
    }
    
    // Finally, if no value again, generate it
    if (![UUID length] > 0)
    {
        // If the system version is less than 6.0, use CFUUIDRef to generate uniqueId
        float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
        if (iOSVersion < 6.0f)
        {
            CFUUIDRef theUUID = CFUUIDCreate(NULL);
            CFStringRef string = CFUUIDCreateString(NULL, theUUID);
            CFRelease(theUUID);
            UUID = [(__bridge NSString*)string stringByReplacingOccurrencesOfString:@"-" withString:@""];
        }
        // If the system version is greater or equal than 6.0, use identifierForVendor
        else
        {
            UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        }
        
        // Save it to the preferences and to the keychain
        [userDefaults setObject:UUID forKey:prefKeyName];
        [SSKeychain setPassword:UUID forService:[[NSBundle mainBundle] bundleIdentifier] account:@"user"];
    }
}
@end
