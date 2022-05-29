//
//  UIButton+Animation.h
//  Pods-PROJECT_Example
//
//  Created by ZhangKaiChao on 2017/10/26.
//

#import <UIKit/UIKit.h>

@interface UIButton (Animation)

/**
 当前的标题
 */
@property (nonatomic , copy) NSString *strTitle;
/**
 旋转菊花
 */
@property (nonatomic , strong) UIActivityIndicatorView *activityView;

/**
 添加菊花
 */
- (void)addActivityView;

/**
 开始旋转菊花
 */
- (void)startAnimating;

/**
 停止旋转
 */
- (void)stopAnimating;

/**
 是否在旋转
 
 @return Yes 是
 */
- (BOOL)isAnimating;

@end
