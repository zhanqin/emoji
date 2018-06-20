//
//  EmojHelper.m
//  emoj_demo
//
//  Created by zhanqin on 2018/6/20.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "EmojiHelper.h"

@implementation EmojiHelper

+(BOOL)isIncludeEmoji:(NSString *)message{
    BOOL isInclude = NO;
    int startLoctaion = 0;
    int endLocation = 0;
    for (int i = 0; i < message.length; i ++) {
        if ([[message substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"["]) {
            //起始位置
            startLoctaion = i;
        }
        if ([[message substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"]"]) {
            //结束位置
            endLocation = i;
        }
        if (endLocation) {
            NSString * expression = [message substringWithRange:NSMakeRange(startLoctaion, endLocation - startLoctaion + 1)];
            isInclude = [EmojiHelper isEmojiString:expression];
            if (isInclude) {
                break;
            }else{
                startLoctaion = 0;
                endLocation = 0;
            }
        }
        
    }
    return isInclude;
}

+(BOOL)isEmojiString:(NSString *)string{
    BOOL isExpression = NO;
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"emtionMeans" ofType:@"plist"];
    NSDictionary * expressionMeansDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    for (NSString * key in [expressionMeansDictionary allKeys]) {
        if ([string isEqualToString:expressionMeansDictionary[key]]) {
            isExpression = YES;
            break;
        }
    }
    return isExpression;
}

@end
