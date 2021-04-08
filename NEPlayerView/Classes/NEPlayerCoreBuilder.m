//
//  NEPlayerCoreBuilder.m
//  NEPlayerView
//
//  Created by WangSen on 2021/4/8.
//

#import "NEPlayerCoreBuilder.h"
#import "NEAVPlayerCore.h"

@implementation NEPlayerCoreBuilder

+ (id<NEPlayerCoreProtocol>)playerCoreWithCoreType:(NEPlayerCoreType)coreType {
    id <NEPlayerCoreProtocol> playerCore;
    switch (coreType) {
        case NEPlayerCoreTypeAVPlayer: {
            playerCore = [[NEAVPlayerCore alloc] init];
        } break;
        default: {
            // 不识别的不返回
//            playerCore = [[NEAVPlayerCore alloc] init];
        } break;
    }
    return playerCore;
}

@end
