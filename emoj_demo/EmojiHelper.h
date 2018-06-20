//
//  EmojHelper.h
//  emoj_demo
//
//  Created by zhanqin on 2018/6/20.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmojiHelper : NSObject

+(BOOL)isIncludeEmoji:(NSString *)message;

+(BOOL)isEmojiString:(NSString *)string;

@end
