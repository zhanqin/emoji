//
//  EmojView.m
//  emoj_demo
//
//  Created by zhanqin on 2018/6/20.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "EmojiView.h"

@interface EmojiView ()

@property(nonatomic,strong) NSDictionary * emojiMeansDictionary;

@end

@implementation EmojiView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"emtions" ofType:@"plist"];
    //表情含义--表情图片
    NSDictionary * emojDic = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    //表情含义
    NSArray * keysArray = @[@"[憨笑]",@"[奸笑]",@"[惊呆]",@"[疑问]"];
    for (int i = 0; i < keysArray.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20 + i*30, 20, 25, 25);
        button.tag = 60000 + i;
        NSString * key = keysArray[i];
        //根据含义取得表情图片，展示表情
        [button setImage:[UIImage imageNamed:[emojDic objectForKey:key]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(selectEmtionClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)selectEmtionClick:(UIButton *)button{
    NSString * key = [NSString stringWithFormat:@"%d",(int)button.tag];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedEmoji:)]) {
        //根据tag值获取表情含义
        [self.delegate selectedEmoji:self.emojMeansDictionary[key]];
    }
}

-(NSDictionary *)emojMeansDictionary{
    if (!_emojiMeansDictionary) {
        NSString * filePath = [[NSBundle mainBundle] pathForResource:@"emtionMeans" ofType:@"plist"];
        _emojiMeansDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    }
    return _emojiMeansDictionary;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
