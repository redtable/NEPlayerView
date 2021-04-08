//
//  NEPlayerCoreBuilder.h
//  NEPlayerView
//
//  Created by WangSen on 2021/4/8.
//

#import <Foundation/Foundation.h>
#import "NEPlayerCoreProtocol.h"
#import "NEPlayerViewDefination.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEPlayerCoreBuilder : NSObject

+ (id<NEPlayerCoreProtocol> _Nullable)playerCoreWithCoreType:(NEPlayerCoreType)coreType;

@end

NS_ASSUME_NONNULL_END
