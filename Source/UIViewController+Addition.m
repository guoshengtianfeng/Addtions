//
//  UIViewController+Addition.m
//  BossAssistant
//
//  Created by ZERO. on 15/4/29.
//  Copyright (c) 2015年 Jucongyuan. All rights reserved.
//

#import "UIViewController+Addition.h"

@implementation UIViewController (Addition)

- (void)setTranslucent:(BOOL)translucent
{
    [self.navigationController.navigationBar setTranslucent:translucent];
}

- (void)setShadowImage:(UIImage *)shadowImage
{
    [self.navigationController.navigationBar setShadowImage:shadowImage];
}

- (void)createLeftImageBtn:(NSString *) imgStr
{
    
    UIImage* imgButtonPanel = [UIImage imageNamed:imgStr];
    CGFloat width = imgButtonPanel.size.width > 40 ? imgButtonPanel.size.width : 40;
    CGFloat height = imgButtonPanel.size.height > 39 ? imgButtonPanel.size.height : 39;
    UIButton* buttonPanel = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonPanel.frame = CGRectMake(0, 0, width, height);
    [buttonPanel setImage:imgButtonPanel forState:UIControlStateNormal];
    [buttonPanel setImage:imgButtonPanel forState:UIControlStateHighlighted];
    [buttonPanel addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [buttonPanel setContentMode:UIViewContentModeCenter];
    
    UIView *clickView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [clickView addSubview:buttonPanel];
    UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:-15];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:clickView];
    UIBarButtonItem *blankButton = [[UIBarButtonItem alloc] initWithCustomView:blankView];

    self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftButton, blankButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}



-(void)leftBtnClicked:(id)sender
{
    if (self.navigationController&&[[self.navigationController childViewControllers] count]>1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
