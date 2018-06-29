//
//  UIView+FontZoom.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/28.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "UIView+FontZoom.h"
#import <objc/runtime.h>

@implementation UIView (FontZoom)

// 定义关联的key
static const char *key = "fontZoom";

//适配参数
#define kScale     [UIScreen mainScreen].bounds.size.width/375.0 //以6为基准图

- (void)setFontZoom:(BOOL)fontZoom{
    objc_setAssociatedObject(self, key, @(fontZoom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (fontZoom) {
        if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
            /*
            UIButton *btn = (UIButton *)self;
            btn.titleLabel.font = [UIFont systemFontOfSize:btn.titleLabel.font.pointSize *kScale];
             */

            UILabel * label = [self valueForKey:@"titleLabel"];
            label.font = [UIFont systemFontOfSize:label.font.pointSize *kScale];
        }else if ([@[@"UILabel",@"UITextField",@"UITextView"] containsObject:NSStringFromClass(self.class)]){
            UIFont * font = [self valueForKey:@"font"];
            [self setValue:[UIFont systemFontOfSize: font.pointSize*kScale] forKey:@"font"];
        }else{
            return;
        }
    }
}

- (BOOL)fontZoom{
    
    return [objc_getAssociatedObject(self, key) boolValue];
}

@end
