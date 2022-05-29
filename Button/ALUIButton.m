//
//  ALUIButton.m
//  AllinmdProject
//
//  Created by ZhangKaiChao on 15/3/21.
//  Copyright (c) 2015年 Mac_Libin. All rights reserved.
//

#import "ALUIButton.h"
@implementation ALUIButton

- (instancetype)init {
    
    if (self = [super init]) {
        [self setExclusiveTouch:YES];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setExclusiveTouch:YES];
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (!CGSizeEqualToSize(self.touchAreaSize, CGSizeZero)) {
        CGRect bounds =self.bounds;
        CGFloat fixWidth = self.touchAreaSize.width - bounds.size.width;
        CGFloat fixHeight = self.touchAreaSize.height- bounds.size.height;
        bounds =CGRectInset(bounds, - 0.5 * fixWidth, - 0.5 * fixHeight);
        return CGRectContainsPoint(bounds, point);
    } else {
        return [super pointInside:point withEvent:event];
    }
}

@end
