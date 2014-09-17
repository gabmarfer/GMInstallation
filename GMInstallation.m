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
        // If the system version is greater or equal than 6.0, use identifierForVendor
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        // Save it to the preferences and to the keychain
        [userDefaults setObject:UUID forKey:prefKeyName];
        [SSKeychain setPassword:UUID forService:[[NSBundle mainBundle] bundleIdentifier] account:@"user"];
    }
}
@end
