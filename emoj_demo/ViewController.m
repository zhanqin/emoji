//
//  ViewController.m
//  emoj_demo
//
//  Created by zhanqin on 2018/6/20.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import "ViewController.h"
#import "EmojiView.h"
#import "MLEmojiLabel.h"

@interface ViewController ()<EmojiViewDelegate>

@property(nonatomic,strong) EmojiView * emojView;
@property(nonatomic,strong) MLEmojiLabel * emojiLabel;
@property(nonatomic,strong) UILabel * measLabel;
@property(nonatomic,strong) NSMutableString * emojiString;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.emojiString = [NSMutableString string];
    [self.view addSubview:self.emojView];
    [self.view addSubview:self.measLabel];
    [self.view addSubview:self.emojiLabel];
}

-(void)selectedEmoji:(NSString *)emojiString{
    [self.emojiString appendString:emojiString];
    [self.emojiString appendString:@"哈哈"];
    [self.emojiLabel setEmojiText:self.emojiString];
    self.measLabel.text = self.emojiString;
}

-(EmojiView *)emojView{
    if (!_emojView) {
        _emojView = [[EmojiView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 50)];
        _emojView.delegate = self;
    }
    return _emojView;
}

-(MLEmojiLabel *)emojiLabel{
    if (!_emojiLabel) {
        _emojiLabel = [[MLEmojiLabel alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 120, self.view.frame.size.width - 40, 100)];
        _emojiLabel.numberOfLines = 0;
        _emojiLabel.font = [UIFont systemFontOfSize:15];
    }
    return _emojiLabel;
}

-(UILabel *)measLabel{
    if (!_measLabel) {
        _measLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 240, self.view.frame.size.width - 40, 100)];
        _measLabel.font = [UIFont systemFontOfSize:15];
        _measLabel.numberOfLines = 0;
        _measLabel.textColor = [UIColor orangeColor];
    }
    return _measLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
