//
//  UIButton+Position.m
//  IOSTEST
//
//  Created by ZhangKaiChao on 2017/9/25.
//  Copyright © 2017年 ZhangKaiChao. All rights reserved.
//

#import "UIButton+Position.h"
#import <WYBaseFrameWork/UIView+Utility.h>

@implementation UIButton (Position)

- (void)setImagePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing {
    
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    /**
     上面代码的在设置Postion的时候，会改变状态
     */
    [self setImageOriginStatePosition:postion spacing:spacing];
}

- (void)updateImageOriginStatePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing{
    
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    /**
     上面代码的在设置Postion的时候，会改变状态
     */
    [self setImageOriginStatePosition:postion spacing:spacing];
    
    //自适应计算宽高，解决粗体上，使用上面的函数无法准确计算宽高出现"..."的问题，切记在调用之前需要将图文都设置
    
    switch (postion) {
        case eLXMImagePositionLeft:
        case eLXMImagePositionRight:
        {
            float width = [self.titleLabel sizeThatFits:CGSizeZero].width + self.currentImage.size.width + spacing + 1;
            float height = MAX([self.titleLabel sizeThatFits:CGSizeZero].height, self.currentImage.size.height) + 1;
            self.width = width;
            self.height = height;//外面可以重新设置，内部默认一个高度
        }
            break;
        
        case eLXMImagePositionTop:
        case eLXMImagePositionBottom:{
            float width = MAX([self.titleLabel sizeThatFits:CGSizeZero].width, self.currentImage.size.width) + 1;
            float height = [self.titleLabel sizeThatFits:CGSizeZero].height + self.currentImage.size.height + spacing + 1;
            self.width = width;
            self.height = height;
        }
            break;
        default:
            break;
    }
}

- (void)reset {
    
    self.imageEdgeInsets = UIEdgeInsetsZero;
    self.titleEdgeInsets = UIEdgeInsetsZero;
    self.contentEdgeInsets = UIEdgeInsetsZero;
}

- (void)setImageOriginStatePosition:(LXMImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [self.titleLabel sizeToFit];
    CGFloat labelWidth = self.titleLabel.frame.size.width;
    CGFloat labelHeight = self.titleLabel.frame.size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case eLXMImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
        case eLXMImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
        case eLXMImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
        case eLXMImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
        default:
            break;
    }
    
}

@end
