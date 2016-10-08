//
//  ViewController.m
//  手势解锁
//
//  Created by lujianrong on 16/10/9.
//  Copyright © 2016年 JianRong-Lu. All rights reserved.
//

#import "ViewController.h"
#import "GesturesUnlock.h"
#import "UIView+BlockFrame.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    [self.view addSubview:img];
    img.frame = self.view.bounds;
    
    GesturesUnlock *lockView = [[GesturesUnlock alloc] init];
    lockView.bk_w(300).bk_h(300).bk_center(self.view.center);
    
    [self.view addSubview:lockView];
}





@end
