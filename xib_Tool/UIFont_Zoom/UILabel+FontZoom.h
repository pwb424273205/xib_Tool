//
//  UILabel+FontZoom.h
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/28.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FontZoom)

/**
 UILabel类添加属性  fontZoom
 IBInspectable关键字用于插入xib页面效果
 */
@property(nonatomic, assign)IBInspectable BOOL fontZoom;

@end
