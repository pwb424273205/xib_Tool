//
//  UIView+Operation.h
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Operation)

/**
 给类UIView添加属性  圆角
 */
@property(nonatomic, assign)IBInspectable float roundCorner;


/**
 给UIView类添加属性  边宽
 */
@property(nonatomic, assign)IBInspectable float borderWide;


/**
 给UIView类添加属性  边框颜色
 */
@property(nonatomic, strong)IBInspectable UIColor* borderColor;

@end
