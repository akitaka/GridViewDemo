//
//  Plist.h
//  plist.test
//
//  Created by Tom HU on 2012/12/24.
//  Copyright (c) 2012年 Tom HU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plist : NSObject

+(id)readPlist:(NSString *)plist;
+(NSInteger)readPlistNumber:(NSString *)plist;
+(id)exchangePlist:(NSString *)plist data1:(NSString *)data1 data2:(NSString *)data2;
@end
