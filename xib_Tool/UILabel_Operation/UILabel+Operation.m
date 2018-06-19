//
//  UILabel+Operation.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "UILabel+Operation.h"
#import <objc/runtime.h>

// 定义关联的key
static const char *lineTypekey = "lineType";
static const char *lineColorkey = "lineType";

@implementation UILabel (Operation)

/**********************......下划线设置.........***************************/
- (void)setLineType:(NSInteger)lineType{
    objc_setAssociatedObject(self, lineTypekey, @(lineType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.text && self.text.length > 0) {
        switch (lineType) {
            case 0:
                break;
            case Underline:{
                if (self.attributedText) {
                    //存在富文本添加在原富文本基础上
                    NSAttributedString *attributed = [[NSAttributedString alloc] initWithAttributedString:self.attributedText];
                    NSMutableAttributedString*mutabAttributed = [attributed mutableCopy];
                    [mutabAttributed addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.text.length)];
                    self.attributedText = mutabAttributed;
                }else{
                    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
                    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self.text attributes:attribtDic];
                    // 赋值
                    self.attributedText = attribtStr;
                }

            }
                break;
            case Deleteline:{
                if (self.attributedText) {
                    //存在富文本添加在原富文本基础上
                    NSAttributedString *attributed = [[NSAttributedString alloc] initWithAttributedString:self.attributedText];
                    NSMutableAttributedString*mutabAttributed = [attributed mutableCopy];
                    [mutabAttributed addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, self.text.length)];
                    self.attributedText = mutabAttributed;
                }else{
                    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
                    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self.text attributes:attribtDic];
                    // 赋值
                    self.attributedText = attribtStr;
                }
            }
                break;
            default:
                break;
        }
    }
}

- (NSInteger)lineType{
    return [objc_getAssociatedObject(self, lineTypekey) integerValue];
}


/**********************......下划线颜色设置.........***************************/
- (void)setLineColor:(UIColor*)lineColor{
    objc_setAssociatedObject(self, lineColorkey, lineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.text && self.text.length > 0) {
        if (self.attributedText) {
            NSAttributedString *attributed = [[NSAttributedString alloc] initWithAttributedString:self.attributedText];
            NSMutableAttributedString*mutabAttributed = [attributed mutableCopy];
            //存在下划线给下划线设置颜色属性
            [attributed enumerateAttribute:NSUnderlineStyleAttributeName inRange:NSMakeRange(0, self.text.length) options:NSAttributedStringEnumerationReverse usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
                if (value) {
                    [mutabAttributed addAttribute:NSUnderlineColorAttributeName value:lineColor range:NSMakeRange(0, self.text.length)];
                }
            }];
            //存在删除线线给下划线设置颜色属性
            [attributed enumerateAttribute:NSStrikethroughStyleAttributeName inRange:NSMakeRange(0, self.text.length) options:NSAttributedStringEnumerationReverse usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
                if (value) {
                    [mutabAttributed addAttribute:NSStrikethroughColorAttributeName value:lineColor range:NSMakeRange(0, self.text.length)];
                }
            }];
            self.attributedText = mutabAttributed;
        }
    }
}

- (UIColor*)lineColor{
    return objc_getAssociatedObject(self, lineColorkey);
}

@end
