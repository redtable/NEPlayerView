//
//  NEPlayerCoreProtocol.h
//  NEPlayerView
//
//  Created by WangSen on 2021/4/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NEPlayerCoreProtocol <NSObject>

@property (nonatomic, strong) CALayer * mediaLayer;

- (void)playWithURL:(NSURL *)URL;

- (void)play;

- (void)pause;

- (void)stop;

- (void)seekToTime:(NSTimeInterval)time completion:(void(^)(BOOL isFinished))completion;

@end

NS_ASSUME_NONNULL_END
