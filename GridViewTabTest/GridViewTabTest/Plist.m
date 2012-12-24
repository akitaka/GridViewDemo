//
//  Plist.m
//  plist.test
//
//  Created by Tom HU on 2012/12/24.
//  Copyright (c) 2012年 Tom HU. All rights reserved.
//

#import "Plist.h"

@implementation Plist

+(id)readPlist:(NSString *)plist
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    return dict;
}

+(NSInteger)readPlistNumber:(NSString *)plist
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSLog(@"autoget: %i",[dict count]);
    return [dict count];
}

+(id)exchangePlist:(NSString *)plist data1:(NSString *)data1 data2:(NSString *)data2
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *dt1 = [dict objectForKey:data1];
    NSArray *dt2 = [dict objectForKey:data2];
    [dict setValue:dt2 forKey:data1];
    [dict setValue:dt1 forKey:data2];
    
    [dict writeToFile:plistPath atomically:YES];
    return dict;
}
@end
