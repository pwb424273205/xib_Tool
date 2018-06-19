//
//  UIView+Operation.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "UIView+Operation.h"
#import <objc/runtime.h>

@implementation UIView (Operation)

// 定义关联的key
static const char *roundCornerkey = "roundCorner";
static const char *borderWidekey = "borderWide";
static const char *borderColorkey = "borderColor";

/**********************.........圆角......***************************/
- (void)setRoundCorner:(float)roundCorner{
    objc_setAssociatedObject(self, roundCornerkey, @(roundCorner), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (roundCorner) {
        self.layer.cornerRadius = roundCorner;
    }
}

- (float)roundCorner{
    return [objc_getAssociatedObject(self, roundCornerkey) floatValue];
}

/**********************.........边宽......***************************/
- (void)setBorderWide:(float)borderWide{
    objc_setAssociatedObject(self, borderWidekey, @(borderWide), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (borderWide) {
        self.layer.borderWidth = borderWide;
    }
}

- (float)borderWide{
    return [objc_getAssociatedObject(self, borderWidekey) floatValue];
}


/**********************.........边框颜色......***************************/
- (void)setBorderColor:(UIColor *)borderColor{
    objc_setAssociatedObject(self, borderColorkey, borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (borderColor) {
        self.layer.borderColor = [borderColor CGColor];
    }
}

- (UIColor *)borderColor{
    return objc_getAssociatedObject(self, borderWidekey);
}

@end
