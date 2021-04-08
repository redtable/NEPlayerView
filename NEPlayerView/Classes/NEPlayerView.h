//
//  NEPlayerView.h
//  NEPlayerView
//
//  Created by WangSen on 2021/4/7.
//

#import <UIKit/UIKit.h>
#import "NEPlayerViewConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEPlayerView : UIView

- (instancetype)initWithConfiguration:(NEPlayerViewConfiguration *)configuration;

- (void)playWithURL:(NSURL *)URL;

@end

NS_ASSUME_NONNULL_END
