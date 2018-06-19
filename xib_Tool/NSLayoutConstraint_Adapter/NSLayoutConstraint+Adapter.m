//
//  NSLayoutConstraint+Adapter.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "NSLayoutConstraint+Adapter.h"
#import <objc/runtime.h>

// 定义关联的key
static const char *key = "adapterScreen";

//适配参数
#define kScale     [UIScreen mainScreen].bounds.size.width/375.0 //以6为基准图

@implementation NSLayoutConstraint (Adapter)

- (void)setAdapterScreen:(BOOL)adapterScreen{
    
    objc_setAssociatedObject(self, key, @(adapterScreen), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (adapterScreen) {
        self.constant = self.constant * kScale;
    }
}

- (BOOL)adapterScreen{
    
    return [objc_getAssociatedObject(self, key) boolValue];
}


@end
