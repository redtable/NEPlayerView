//
//  NEViewController.m
//  NEPlayerView
//
//  Created by redtable on 04/07/2021.
//  Copyright (c) 2021 redtable. All rights reserved.
//

#import "NEViewController.h"
#import <NEPlayerView/NEPlayerView.h>
#import <Masonry/Masonry.h>

@interface NEViewController ()

@property (nonatomic, strong) NEPlayerView * playerView;

@end

@implementation NEViewController

/*
 
 https://k12-t-1252350207.cos.ap-beijing.myqcloud.com/interactivevideo/resource/2020/12/10/4be5e96e-1f7a-2b15-5550-4ad05cd9862c_4fe22f6c-38a3-4ecc-8404-6d4709d26286.mp4
 
 https://k12-t-1252350207.cos.ap-beijing.myqcloud.com/interactivevideo/resource/2020/12/10/c450768f-1d67-a00c-a6de-0d3e52de8a86_f85f2f46-5302-4d13-b134-5eee959f8a34.mp4
 
 https://k12-t-1252350207.cos.ap-beijing.myqcloud.com/interactivevideo/resource/2020/12/10/080c6c30-f7e7-a69a-8e49-014c147f16a4_6400725b-0438-40d6-9a57-423a472aad2c.mp4
 
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.playerView];
//    self.playerView.frame = CGRectMake(15.f, 100.f, 300.f, 300.f);
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100.f);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(300.f);
    }];
    [self.playerView playWithURL:[NSURL URLWithString:@"https://k12-t-1252350207.cos.ap-beijing.myqcloud.com/interactivevideo/resource/2020/12/10/4be5e96e-1f7a-2b15-5550-4ad05cd9862c_4fe22f6c-38a3-4ecc-8404-6d4709d26286.mp4"]];
    UIButton * frameChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [frameChangeButton setTitle:@"ChangeFrame" forState:UIControlStateNormal];
    [frameChangeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [frameChangeButton addTarget:self action:@selector(changeFrameAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:frameChangeButton];
    [frameChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200.f, 100.f));
        make.top.equalTo(self.playerView.mas_bottom).offset(50.f);
        make.centerX.equalTo(self.playerView);
    }];
}

- (void)changeFrameAction:(UIButton *)button {
    static BOOL mark = YES;
    CGRect frame = mark?CGRectMake(0.f, 240.f, self.view.frame.size.width, 200.f):CGRectMake(0.f, 100.f, 280.f, 400.f);
    mark = !mark;
    [self.playerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(frame.origin.y);
        make.left.equalTo(self.view);
        make.size.mas_equalTo(frame.size);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NEPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[NEPlayerView alloc] init];
    }
    return _playerView;
}

@end
