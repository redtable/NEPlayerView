//
//  NEPlayerViewConfiguration.h
//  NEPlayerView
//
//  Created by WangSen on 2021/4/8.
//

#import <Foundation/Foundation.h>
#import "NEPlayerViewDefination.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEPlayerViewConfiguration : NSObject

@property (nonatomic, assign) NEPlayerCoreType coreType; ///< 播放器内核类型，default  AVPlayer

+ (instancetype)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
