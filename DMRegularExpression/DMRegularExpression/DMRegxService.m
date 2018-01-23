//
//  DMRegxService.m
//  DMRegularExpression
//
//  Created by lbq on 2018/1/23.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMRegxService.h"

@implementation DMRegxService
+ (NSRegularExpression *)regexTagA {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"<a>.*?</a>" options:kNilOptions error:NULL];
    });
    return regex;
}


+ (NSRegularExpression *)regexTagB {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        @"<a href=\"(.*?)\">(.*?)</a>"
//        regex = [NSRegularExpression regularExpressionWithPattern:@"<a href=(?:.*?)>(.*?)</a>" options:kNilOptions error:NULL];
        regex = [NSRegularExpression regularExpressionWithPattern:@"<a href=(.*?)>(.*?)</a>" options:kNilOptions error:NULL];
    });
    return regex;
}

+ (NSRegularExpression *)regexTag
{
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        @"<a href=\"(.*?)\">(.*?)</a>"
//        <[^>]*>|\n|&nbsp
//        <.+?>(.+?)<.+?>
        regex = [NSRegularExpression regularExpressionWithPattern:@"<a><text>(.*?)</text><schema>(.*?)</schema>(<url>(.*?)</url><version>(.*?)</version>.*?)?</a>" options:kNilOptions error:NULL];
    });
    return regex;
}
@end
