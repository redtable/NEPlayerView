//
//  NEAVPlayerCore.m
//  NEPlayerView
//
//  Created by WangSen on 2021/4/7.
//

#import "NEAVPlayerCore.h"
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVPlayerItem.h>
#import <AVFoundation/AVPlayerLayer.h>

static int32_t const kPreferredTimescale = 600;

@interface NEAVPlayerCore () <CALayerDelegate>

@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerLayer * playerLayer;
@property (nonatomic, strong) AVPlayerItem * currentPlayerItem;

@end

@implementation NEAVPlayerCore
@synthesize mediaLayer;

- (instancetype)init {
    if (self = [super init]) {
        self.playerLayer.player = self.player;
    }
    return self;
}

#pragma mark - NEPlayerCoreProtocol -

- (void)setMediaLayer:(CALayer *)mediaLayer {
    [mediaLayer addSublayer:self.playerLayer];
    mediaLayer.delegate = self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    self.playerLayer.frame = layer.bounds;
}

- (void)playWithURL:(NSURL *)URL {
    self.currentPlayerItem = [AVPlayerItem playerItemWithURL:URL];
    [self.player replaceCurrentItemWithPlayerItem:self.currentPlayerItem];
    [self play];
}

- (void)play {
    [self.player play];
}

- (void)pause {
    [self.player pause];
}

- (void)stop {
    [self.player pause];
}

- (void)seekToTime:(NSTimeInterval)time completion:(void (^)(BOOL))completion {
    [self.player seekToTime:CMTimeMakeWithSeconds(time, kPreferredTimescale) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero completionHandler:^(BOOL finished) {
        !completion ?: completion(finished);
    }];
}

#pragma mark - Getters -

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        _playerLayer = [[AVPlayerLayer alloc] init];
    }
    return _playerLayer;
}

- (AVPlayer *)player {
    if (!_player) {
        _player = [[AVPlayer alloc] init];
    }
    return _player;
}

@end
