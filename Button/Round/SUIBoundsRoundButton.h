//
//  SUIBoundsRoundButton.h
//  AllinmdProject
//
//  Created by ZhangKaiChao on 15/3/23.
//  Copyright (c) 2015年 Mac_Libin. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 唯医圆角button基类.
@interface SUIBoundsRoundButton : UIButton

/// 圆角大小.
@property (nonatomic,assign) CGFloat cornerRadios;
/// 边框颜色.
@property (nonatomic,strong) UIColor *strokeColor;
/// 边框大小.
@property (nonatomic,assign) CGFloat strokeLineWidth;
/// hightlight 颜色.
@property (nonatomic,strong) UIColor *highlightedColor;
/// 选中填充颜色.
@property (nonatomic,strong) UIColor *selectFillColor;
/// nomal填充颜色.
@property (nonatomic,strong) UIColor *nomalFillColor;
/// 选中文本颜色.
@property (nonatomic,strong) UIColor *selectTextColor;
/// nomal文本颜色.
@property (nonatomic,strong) UIColor *nomalTextColor;

@end
