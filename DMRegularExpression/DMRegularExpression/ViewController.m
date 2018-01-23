//
//  ViewController.m
//  DMRegularExpression
//
//  Created by lbq on 2018/1/23.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"
#import "DMRegxService.h"
#import <Foundation/Foundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test2];
}

- (void)test{
    NSString *testB = @"占位符占位符<a href=aaa>#我是链接1#</a>占位符<a href='https://www.xxx.com/223?232323&2323'>#我是链接2#</a>占占位符占位符占位符占位符占位符占位符占位符占位符占位符占位符";

    NSArray<NSTextCheckingResult *> *aResults = [[DMRegxService regexTagB] matchesInString:testB options:NSMatchingReportCompletion range:NSMakeRange(0, testB.length)];
    [aResults enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"type = %tu;range = %@===%tu === %@ ===%@",obj.resultType,NSStringFromRange(obj.range),obj.numberOfRanges,NSStringFromRange([obj rangeAtIndex:0]),NSStringFromRange([obj rangeAtIndex:1]));
        
        NSString *link = [testB substringWithRange:[obj rangeAtIndex:0]];
        NSString *text = [testB substringWithRange:[obj rangeAtIndex:1]];
        NSString *text1 = [testB substringWithRange:[obj rangeAtIndex:2]];
        NSLog(@"str=%@==%@==%@",link,text,text1);
    }];
}


- (void)test2{
//    NSString *testB = @"<a><text>@追问</text><schema>msb:userdetail?id=5613c8330d35391551679e77&type=2&cateid=</schema></a>内容abc内容<a><text>小小心</text><schema>type=0</schema><url>http://wwww.baidu.com</url><version>3.0.5</version></a>";
    NSString *test = @"是领导开发技术老地方看见爱上<a><text>@追问</text><schema>type=0</schema></a>时代峰峻卢萨卡房间爱上<a><text>@追问</text><schema>msb:userdetail?id=5613c8330d35391551679e77&type=2&cateid=</schema></a>内容abc内容<a><text>小小心</text><schema>type=0</schema><url>http://wwww.baidu.com</url><version>3.0.5</version></a>内容abc内容<a><text>小小心</text><schema>type=0</schema><url>http://wwww.baidu.com</url><version>3.0.5</version></a>了快睡解放路是<a><text>是领导开发就</text><schema>sfsf</schema></a>";
    NSMutableString *testB = [[NSMutableString alloc] initWithString:test];
    
    NSArray<NSTextCheckingResult *> *aResults = [[DMRegxService regexTag] matchesInString:testB options:NSMatchingReportCompletion range:NSMakeRange(0, testB.length)];
    [aResults enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"type = %tu;range = %@===%tu::::::\n",obj.resultType,NSStringFromRange(obj.range),obj.numberOfRanges);
        
        for (int i = 0; i < obj.numberOfRanges; i++) {
            NSRange range = [obj rangeAtIndex:i];
//            NSLog(@"range == %@",NSStringFromRange(range));
            if (range.location != NSNotFound) {
                NSString *link = [testB substringWithRange:range];
                NSLog(@"str=%@\n",link);
            }
           
        }
    }];
}



@end
