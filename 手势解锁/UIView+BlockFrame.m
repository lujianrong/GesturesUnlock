//
//  UIView+BlockFrame.m
//  LJRBlockTest
//
//  Created by lujianrong on 16/9/15.
//  Copyright © 2016年 JianRong-Lu. All rights reserved.
//

#import "UIView+BlockFrame.h"

@implementation UIView (BlockFrame)

- (UIView *(^)(CGFloat))bk_x {
    return ^(CGFloat x){
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_y {
    return ^(CGFloat y) {
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_w {
    return ^(CGFloat w) {
        CGRect frame = self.frame;
        frame.size.width = w;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_h {
    return ^(CGFloat h) {
        CGRect frame = self.frame;
        frame.size.height = h;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_centerX {
    return ^(CGFloat centerX) {
        CGRect frame = self.frame;
        frame.origin.x = centerX - frame.size.width / 2;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_centerY {
    return ^(CGFloat centerY) {
        CGRect frame = self.frame;
        frame.origin.y = centerY - frame.size.height / 2;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_right {
    return ^(CGFloat right) {
        CGRect frame = self.frame;
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGFloat))bk_bottom {
    return ^(CGFloat bottom) {
        CGRect frame = self.frame;
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGPoint))bk_origin {
    return ^(CGPoint origin) {
        CGRect frame = self.frame;
        frame.origin = origin;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGSize))bk_size {
    return ^(CGSize size) {
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        return self;
    };
}
- (UIView *(^)(CGPoint))bk_center {
    return ^(CGPoint center) {
        CGRect frame = self.frame;
        frame.origin.x = center.x - frame.size.width / 2;
        frame.origin.y = center.y - frame.size.height / 2;
        self.frame = frame;
        return self;
    };
}

#pragma mark - setter & getter
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x {
    return CGRectGetMinX(self.frame);
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y {
    return CGRectGetMinY(self.frame);
}
- (void)setW:(CGFloat)w {
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}
- (CGFloat)w {
    return CGRectGetWidth(self.frame);
}
- (void)setH:(CGFloat)h {
    CGRect frame = self.frame;
    if (h < 1) {
        h = (1.f/[UIScreen mainScreen].scale);
    }
    frame.size.height = h;
    self.frame = frame;
}
- (CGFloat)h {
    return CGRectGetHeight(self.frame);
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size {
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin {
    return self.frame.origin;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}
@end
