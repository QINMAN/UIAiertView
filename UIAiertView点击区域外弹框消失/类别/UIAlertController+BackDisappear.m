//
//  UIAlertController+BackDisappear.m
//  UIAiertView点击区域外弹框消失
//
//  Created by qinman on 16/8/12.
//  Copyright © 2016年 qinman. All rights reserved.
//

#import "UIAlertController+BackDisappear.h"

@implementation UIAlertController (BackDisappear)

- (void)show {
    [self backDisappear];
    //由于还未present到当前视图控制器，所以要先拿到被present的控制器
    [[self getPresentingViewController] presentViewController:self animated:YES completion:nil];
}

- (void)backDisappear {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAlertView:)];
    //    tap.cancelsTouchesInView = NO;
    [[UIApplication sharedApplication].keyWindow addGestureRecognizer:tap];
}

- (void)hideAlertView:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded){
        CGPoint location = [tap locationInView:nil];
        if (![self.view pointInside:[self.view convertPoint:location fromView:self.view.window] withEvent:nil]){
            [self.view.window removeGestureRecognizer:tap];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

//拿到被present的控制器
- (UIViewController *)getPresentingViewController {
    //UITextEffectsWindow : 当控制器在导航控制器下时，不管是否弹出键盘，[UIApplication sharedApplication].windows都会包含UITextEffectsWindow
    UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
    UIView *currentView = currentWindow.subviews.firstObject;
    UIViewController *vc = [self parentController:currentView];
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabVC = (UITabBarController *)vc;
        vc = tabVC.selectedViewController;
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nagVC = (UINavigationController *)vc;
        vc = nagVC.viewControllers.lastObject;
    }
    return vc;
}

//获取视图所在的控制器
- (UIViewController *)parentController:(UIView *)view
{
    UIResponder *responder = [view nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end
