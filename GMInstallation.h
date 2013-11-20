//
//  GMInstallation.h
//
//
//  Created by Gabi Martelo on 17/11/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMInstallation : NSObject

// Generate or load an unique identifier and save to disk
+ (void)generateOrLoadUUIDForPreKey:(NSString *)prefKeyName;

@end
