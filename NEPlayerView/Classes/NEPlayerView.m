//
//  NEPlayerView.m
//  NEPlayerView
//
//  Created by WangSen on 2021/4/7.
//

#import "NEPlayerView.h"
#import "NEPlayerCoreProtocol.h"
#import "NEPlayerCoreBuilder.h"

@interface NEPlayerView ()

@property (nonatomic, strong) id<NEPlayerCoreProtocol> playerCore; ///< 播放器内核
@property (nonatomic, strong) NEPlayerViewConfiguration * configuration; ///< 配置项
@property (nonatomic, strong) UIView * mediaView;

@end

@implementation NEPlayerView

- (void)dealloc {
    
}

- (instancetype)init {
    return [self initWithConfiguration:[NEPlayerViewConfiguration defaultConfiguration]];
}

- (instancetype)initWithConfiguration:(NEPlayerViewConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;
        [self commitInit];
        [self createViewHierarchy];
        [self layoutContentViews];
    }
    return self;
}

- (void)commitInit {
    self.backgroundColor = [UIColor blackColor];
    
}

- (void)createViewHierarchy {
    [self addSubview:self.mediaView];
}

- (void)layoutContentViews {
//    self.mediaView.frame = CGRectMake(10.f, 10.f, self.bounds.size.width - 20.f, self.bounds.size.height - 20.f);
}

#pragma mark - Interfaces -

- (void)playWithURL:(NSURL *)URL {
    [self.playerCore playWithURL:URL];
}

- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
    [CATransaction setDisableActions:YES];
    self.mediaView.frame = self.bounds;
}

#pragma mark - Getters -

- (UIView *)mediaView {
    if (!_mediaView) {
        _mediaView = [[UIView alloc] init];
        _mediaView.backgroundColor = [UIColor yellowColor];
    }
    return _mediaView;
}

- (id<NEPlayerCoreProtocol>)playerCore {
    if (!_playerCore) {
        _playerCore = [NEPlayerCoreBuilder playerCoreWithCoreType:self.configuration.coreType];
        _playerCore.mediaLayer = self.mediaView.layer;
    }
    return _playerCore;
}

@end
