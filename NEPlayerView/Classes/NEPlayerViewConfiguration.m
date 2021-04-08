//
//  NEPlayerViewConfiguration.m
//  NEPlayerView
//
//  Created by WangSen on 2021/4/8.
//

#import "NEPlayerViewConfiguration.h"

@implementation NEPlayerViewConfiguration

+ (instancetype)defaultConfiguration {
    NEPlayerViewConfiguration * configuration = [[NEPlayerViewConfiguration alloc] init];
    configuration.coreType = NEPlayerCoreTypeAVPlayer;
    return configuration;
}

@end
