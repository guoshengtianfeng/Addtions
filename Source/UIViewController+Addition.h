//
//  UIViewController+Addition.h
//  BossAssistant
//
//  Created by ZERO. on 15/4/29.
//  Copyright (c) 2015年 Jucongyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Addition)
//setTranslucent:NO

- (void)setTranslucent:(BOOL) translucent;

- (void)setShadowImage:(UIImage *) shadowImage;

- (void)createLeftImageBtn:(NSString *) imgStr;

@end
