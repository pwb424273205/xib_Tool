//
//  UIButton+FontZoom.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/28.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "UIButton+FontZoom.h"
#import <objc/runtime.h>

@implementation UIButton (FontZoom)

// 定义关联的key
static const char *key = "fontZoom";

//适配参数
#define kScale     [UIScreen mainScreen].bounds.size.width/375.0 //以6为基准图

- (void)setFontZoom:(BOOL)fontZoom{
    objc_setAssociatedObject(self, key, @(fontZoom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (fontZoom) {
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleLabel.font.pointSize *kScale];
    }
}

- (BOOL)fontZoom{
    
    return [objc_getAssociatedObject(self, key) boolValue];
}

@end
