//
//  UIButton+Animation.m
//  Pods-PROJECT_Example
//
//  Created by ZhangKaiChao on 2017/10/26.
//

#import "UIButton+Animation.h"
#import <objc/runtime.h>

char * const kUIAnimationButton = "UIAnimationButton";
char * const kActivityView = "ActivityView";

@implementation UIButton (Animation)

- (void)addActivityView {
    
    if(!self.activityView) {
        UIActivityIndicatorView * activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityView.hidesWhenStopped = YES;
        [self setActivityView:activityView];
    }
    if([self.activityView isDescendantOfView:self] == NO) {
        [self addSubview:self.activityView];
    }
}

- (void)startAnimating {
    
    if (self.isAnimating) {
        return;
    }
    self.strTitle = self.currentTitle;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:@" " forState:self.state];
        CGPoint titleLabCenter = self.titleLabel.center;
        self.activityView.center = titleLabCenter;
        [self.activityView startAnimating];
        self.userInteractionEnabled = NO;
    });
}

- (void)stopAnimating {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activityView stopAnimating];
        self.userInteractionEnabled = YES;
        if (self.strTitle && self.strTitle.length) {
            [self setTitle:self.strTitle forState:self.state];
        }
    });
}

- (BOOL)isAnimating {
    
    return self.activityView.isAnimating;
}

#pragma mark setter & getter

- (void)setStrTitle:(NSString *)strTitle {
    
    objc_setAssociatedObject(self, &kUIAnimationButton, strTitle, OBJC_ASSOCIATION_COPY);
}

- (NSString *)strTitle {
    
    return objc_getAssociatedObject(self, &kUIAnimationButton);
}

- (void)setActivityView:(UIActivityIndicatorView *)activityView {
    
    objc_setAssociatedObject(self, &kActivityView, activityView, OBJC_ASSOCIATION_RETAIN);
}

- (UIActivityIndicatorView *)activityView {
    
    return objc_getAssociatedObject(self, &kActivityView);
}

@end
