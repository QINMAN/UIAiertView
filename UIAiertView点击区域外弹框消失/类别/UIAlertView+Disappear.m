//
//  UIAlertView+Disappear.m
//  UIAiertView点击区域外弹框消失
//
//  Created by qinman on 15/11/20.
//  Copyright © 2015年 qinman. All rights reserved.
//

#import "UIAlertView+Disappear.h"
#import <objc/runtime.h>

@implementation UIAlertView (Disappear)

- (void)disappearAlertView {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAlertView:)];
//    tap.cancelsTouchesInView = NO;
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:tap];
}

- (void)hideAlertView:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded){
        CGPoint location = [tap locationInView:nil];
        if (![self pointInside:[self convertPoint:location fromView:self.window] withEvent:nil]){
            [self.window removeGestureRecognizer:tap];
            [self dismissWithClickedButtonIndex:0 animated:YES];
        }
    }
}

@end
