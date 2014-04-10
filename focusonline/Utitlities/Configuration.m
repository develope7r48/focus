//
//  Configuration.m
//  FAiPad
//
//  Created by Thein on 10/3/11.

#import "Configuration.h"

#define WEBSERVICE  0 //0 for test, 1 for live
@implementation Configuration
     


+ (int) getOSMajorVersion {
    NSString *osVer = [[UIDevice currentDevice] systemVersion];
    NSRange rg = [osVer rangeOfString:@"."];
    if (rg.location != NSNotFound) {
        osVer = [osVer substringToIndex:rg.location];
        return [osVer intValue];
    }
    return [osVer intValue]; // not likely
}

+(NSString *)getBaseURL
{
    
    if (WEBSERVICE)
    {//live
        return @"http://192.168.1.179";
    }
    else
    {//test
        return @"http://192.168.1.179";
        
    }
    
}
@end