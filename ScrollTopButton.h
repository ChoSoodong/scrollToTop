

/**************************/
///////// 滚动到顶部 /////////
/**************************/


#import <UIKit/UIKit.h>

/** 动画方式 */
typedef NS_ENUM(NSInteger,ScrollTopAnimationType){
    ScrollTopAnimationTypeFromBottom = 0,
    ScrollTopAnimationTypeFromRight,
    ScrollTopAnimationTypeFade
    
};

@interface ScrollTopButton : UIButton

/**出现的距离*/
@property(nonatomic, assign)CGFloat distanceWhenShow;

/** 动画方式 */
@property (nonatomic, assign) ScrollTopAnimationType animationType;

/**初始化*/
- (instancetype)initWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView animationType:(ScrollTopAnimationType)animationType;

/**
 初始化 默认动画方式为 从底部出现
 @param scrollView scrollView(例如:scrollView , tableView , collectionView)
 @param superView 父视图(例如:self.view)
 @return button
 */
+(instancetype)scrollTopButtonWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView;


/**
 初始化  指定动画方式

 @param scrollView scrollView(例如:scrollView , tableView , collectionView)
 @param superView 父视图(例如:self.view)
 @param animationType 动画方式
 @return button
 */
+(instancetype)scrollTopButtonWithScrollView:(UIScrollView *)scrollView superView:(UIView *)superView animationType:(ScrollTopAnimationType)animationType;

@end


