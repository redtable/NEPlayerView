#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NEAVPlayerCore.h"
#import "NEPlayerCoreBuilder.h"
#import "NEPlayerCoreProtocol.h"
#import "NEPlayerView.h"
#import "NEPlayerViewConfiguration.h"
#import "NEPlayerViewDefination.h"

FOUNDATION_EXPORT double NEPlayerViewVersionNumber;
FOUNDATION_EXPORT const unsigned char NEPlayerViewVersionString[];

