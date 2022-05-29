//
//  UIButton+Basic.m
//  Pods-PROJECT_Example
//
//  Created by ZhangKaiChao on 2017/10/26.
//

#import "UIButton+Basic.h"
#import <objc/runtime.h>

char * const kUIBasicButton = "UIBasicButton";

@implementation UIButton (Basic)

#pragma mark setter & getter

- (void)setInfo:(id)info {
    
    objc_setAssociatedObject(self, &kUIBasicButton, info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)info {
    
    return objc_getAssociatedObject(self, &kUIBasicButton);
}

@end
