//
//  UILabel+Operation.h
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LineType){
    Emptyline = 0,
    Underline ,
    Deleteline,
};

@interface UILabel (Operation)

/**
 给类Label添加属性  下划线类型
 */
@property(nonatomic, assign)IBInspectable NSInteger lineType;

/**
 给类Label添加属性  下划线颜色
 */
@property(nonatomic, assign)IBInspectable UIColor* lineColor;

@end
