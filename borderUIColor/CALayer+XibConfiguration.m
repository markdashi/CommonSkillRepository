//
//  CALayer+XibConfiguration.m
//  Test
//
//  Created by mark on 2018/7/24.
//  Copyright © 2018年 mark. All rights reserved.
//

#import "CALayer+XibConfiguration.h"
#import <objc/runtime.h>

static char *borderUIColorKey = "borderUIColor";

@implementation CALayer (XibConfiguration)

- (void)setBorderUIColor:(UIColor *)borderUIColor{
    objc_setAssociatedObject(self, borderUIColorKey, borderUIColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.borderColor = borderUIColor.CGColor;
}
- (UIColor *)borderUIColor{
    return objc_getAssociatedObject(self, borderUIColorKey);
}

@end
