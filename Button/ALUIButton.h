//
//  ALUIButton.h
//  AllinmdProject
//
//  Created by ZhangKaiChao on 15/3/21.
//  Copyright (c) 2015年 Mac_Libin. All rights reserved.

#import <UIKit/UIKit.h>

/// 唯医button基类.
@interface ALUIButton : UIButton
/**
 * button 点击区域  用以扩大button的点击区域
 */
@property (nonatomic) CGSize touchAreaSize;

@end
