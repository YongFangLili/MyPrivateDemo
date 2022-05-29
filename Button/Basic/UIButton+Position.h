//
//  UIButton+Position.h
//  IOSTEST
//
//  Created by ZhangKaiChao on 2017/9/25.
//  Copyright © 2017年 ZhangKaiChao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief button 上设置图片和文字位置和间距
 */
typedef NS_ENUM(NSInteger, LXMImagePosition) {
    /**
     *  图片在左，文字在右，默认
     */
    eLXMImagePositionLeft = 0,
    /**
     *  图片在右，文字在左
     */
    eLXMImagePositionRight = 1,
    /**
     *  图片在上，文字在下
     */
    eLXMImagePositionTop = 2,
    /**
     *  图片在下，文字在上
     */
    eLXMImagePositionBottom = 3,
};

@interface UIButton (Position)

/**
 @author houzhiwei, 16-05-11
 
 @brief Description
 
 @param postion 设置button上图片显示的位置
 @param spacing 间距
 
 @since ugc
 */
- (void)setImagePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing;

/**
 
 @brief 必须在setImagePosition之后调用，不改变ControlState，自适应宽高
 
 @param postion 设置button上图片显示的位置
 @param spacing 间距
 */
- (void)updateImageOriginStatePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing;

/**
 
 @brief 设置图片显示的位置，不改变ControlState
 
 @param postion 设置button上图片显示的位置
 @param spacing 间距
 */
- (void)setImageOriginStatePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing;

/**
 重置
 */
- (void)reset;

@end
