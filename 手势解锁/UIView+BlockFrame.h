//
//  UIView+BlockFrame.h
//  LJRBlockTest
//
//  Created by lujianrong on 16/9/15.
//  Copyright © 2016年 JianRong-Lu. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (BlockFrame)
#pragma mark - block setting view's frame
/**
 *  UIView *redView = [[UIView alloc] init];
 *  redView.bk_w(100).bk_h(100).bk_center(self.view.center);
 */
- (UIView *(^)(CGFloat  x))bk_x;
- (UIView *(^)(CGFloat  y))bk_y;
- (UIView *(^)(CGFloat  w))bk_w;
- (UIView *(^)(CGFloat  h))bk_h;
- (UIView *(^)(CGSize   size))bk_size;
- (UIView *(^)(CGPoint  origin))bk_origin;
- (UIView *(^)(CGFloat  centerX))bk_centerX;
- (UIView *(^)(CGFloat  centerY))bk_centerY;
- (UIView *(^)(CGFloat  right))bk_right;
- (UIView *(^)(CGFloat  bottom))bk_bottom;
//方法名不能直接用 center, 会与系统方法冲突
- (UIView *(^)(CGPoint center))bk_center;

#pragma mark - property
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat w;
@property (assign, nonatomic) CGFloat h;
@property (assign, nonatomic) CGSize  size;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat bottom;
@end
