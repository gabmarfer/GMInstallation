//
//  GMInstallation.h
//
//
//  Created by Gabi Martelo on 17/11/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMInstallation : NSObject

/**
 * Generate or load from KeyChain a new uniqueID and save to disk (PrefKey)
 *
 * @param prefKeyName A NSString with the PrefKey name that will be used to store the unique identifier
 * @return
 */
+ (void)generateOrLoadUUIDForPreKey:(NSString *)prefKeyName;

@end
