//
//  ViewController.m
//  UIAiertView点击区域外弹框消失
//
//  Created by qinman on 15/11/20.
//  Copyright © 2015年 qinman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    newBtn.frame = CGRectMake(150, 100, 100, 100);
    [newBtn setTitle:@"newClick" forState:UIControlStateNormal];
    [self.view addSubview:newBtn];
    [newBtn addTarget:self action:@selector(makeAlertCtrl) forControlEvents:UIControlEventTouchUpInside];
}

- (void)makeAlertCtrl {

    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:nil message:@"点击区域外弹框消失" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击的是确定");
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击的是取消");
    }];
    [alertCtrl addAction:cancleAction];
    [alertCtrl addAction:confirmAction];
    [alertCtrl performSelector:@selector(show)];

}

@end
