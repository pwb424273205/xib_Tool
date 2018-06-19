//
//  NSLayoutConstraint+Adapter.h
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Adapter)

/**
 给约束类添加属性  adapterScreen
 IBInspectable关键字用于插入xib页面效果
 */
@property(nonatomic, assign)IBInspectable BOOL adapterScreen;

@end
