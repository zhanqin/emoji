//
//  EmojView.h
//  emoj_demo
//
//  Created by zhanqin on 2018/6/20.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmojiViewDelegate <NSObject>

-(void)selectedEmoji:(NSString *)emojiString;

@end

@interface EmojiView : UIView

@property(nonatomic,weak) id<EmojiViewDelegate>delegate;


@end
