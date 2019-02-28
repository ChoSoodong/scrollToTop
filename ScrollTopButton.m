





#import "ScrollTopButton.h"

#define STScreenWidth [UIScreen mainScreen].bounds.size.width
#define STScreenHeight [UIScreen mainScreen].bounds.size.height
#define STDefaultW 40

@implementation ScrollTopButton{
    
    __weak UIScrollView *_scrollView;
}

- (instancetype)initWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView animationType:(ScrollTopAnimationType)animationType{
    
    if (self = [super init]) {
        self.animationType = animationType;
        [self setupWithScrollView:scrollView];
        
        
        [superView addSubview:self];
    }
    return self;
}

+(instancetype)scrollTopButtonWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView{
    
    return [[self alloc] initWithScrollView:scrollView superView:superView animationType:ScrollTopAnimationTypeFromBottom];
    
}
+(instancetype)scrollTopButtonWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView animationType:(ScrollTopAnimationType)animationType{
    return [[self alloc] initWithScrollView:scrollView superView:superView animationType:animationType];
}


- (void)setupWithScrollView:(UIScrollView *)scrollView{
    
    _scrollView = scrollView;
    self.distanceWhenShow = self.distanceWhenShow ?:STScreenHeight;
    
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[UIImage imageNamed:@"back_to_top"] forState:UIControlStateNormal];
    
    
   self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight, STDefaultW, STDefaultW);

    [self addTarget:self action:@selector(scrollToTopClick) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)setAnimationType:(ScrollTopAnimationType)animationType{
    _animationType = animationType;
    
    //判断动画类型
    switch (self.animationType) {
        case ScrollTopAnimationTypeFromBottom:
            self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight, STDefaultW, STDefaultW);
            self.alpha = 1;
            break;
        case ScrollTopAnimationTypeFromRight:
            self.frame = CGRectMake(STScreenWidth, STScreenHeight-180, STDefaultW, STDefaultW);
            self.alpha = 1;
            break;
        case ScrollTopAnimationTypeFade:
            self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight-180, STDefaultW, STDefaultW);
            self.alpha = 0;
            break;
        default:
            break;
    }
    
}


#pragma mark - 滚动顶部
- (void)scrollToTopClick{
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x, 0) animated:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    CGPoint point = [change[@"new"] CGPointValue];
    if (point.y <= self.distanceWhenShow) {
        
        [self dismiss];
    }else{
        [self show];
    }
}

#pragma mark - 移除监听
- (void)dealloc{
    
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

#pragma mark - 显示
-(void)show{
    
    switch (self.animationType) {
        case ScrollTopAnimationTypeFromBottom:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight-180, STDefaultW, STDefaultW);
            }];
        }
            break;
            
        case ScrollTopAnimationTypeFromRight:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight-180, STDefaultW, STDefaultW);
            }];
        }
            break;
            
        case ScrollTopAnimationTypeFade:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.alpha = 1;
            }];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 消失
-(void)dismiss{
    
    switch (self.animationType) {
        case ScrollTopAnimationTypeFromBottom:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = CGRectMake(STScreenWidth - STDefaultW - 10, STScreenHeight, STDefaultW, STDefaultW);
            }];
        }
            break;
            
        case ScrollTopAnimationTypeFromRight:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.frame = CGRectMake(STScreenWidth, STScreenHeight-180, STDefaultW, STDefaultW);
            }];
        }
            break;
            
        case ScrollTopAnimationTypeFade:
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.alpha = 0;
            }];
        }
            break;
            
        default:
            break;
    }
}


@end
