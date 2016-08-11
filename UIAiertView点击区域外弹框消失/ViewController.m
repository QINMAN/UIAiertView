//
//  ViewController.m
//  UIAiertView点击区域外弹框消失
//
//  Created by qinman on 15/11/20.
//  Copyright © 2015年 qinman. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Disappear.h"

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"git测试");
//    NSRunLoop
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(10, 100, 100, 100);
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(makeAlert) forControlEvents:UIControlEventTouchUpInside];
}

- (void)makeAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"点击区域外弹框消失" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"confirm", nil];
    [alert show];
    [alert disappearAlertView];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"点击的是--%zd",buttonIndex);
}
@end
