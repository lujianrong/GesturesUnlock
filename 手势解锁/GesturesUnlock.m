//
//  GesturesUnlock.m
//  GesturesUnlock(手势解锁)
//
//  Created by lujianrong on 16/9/8.
//  Copyright © 2016年 JianRong-Lu. All rights reserved.
//

#import "GesturesUnlock.h"

@interface GesturesUnlock()

/** 记录划过了哪些按钮*/
@property (nonatomic, strong) NSMutableArray *selectedbtns;
/** 当前手指的位置*/
@property (nonatomic, assign)  CGPoint currentPoint;

@end

@implementation GesturesUnlock

- (NSMutableArray *)selectedbtns {
    if (!_selectedbtns) {
        _selectedbtns = @[].mutableCopy;
    }
    return _selectedbtns;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    UIImage *selectedImage = [UIImage imageNamed:@"gesture_node_selected"];
    UIImage *normalImage = [UIImage imageNamed:@"gesture_node_normal"];
    
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        btn.tag = i;
        [btn setImage:selectedImage forState:UIControlStateSelected];
        [btn setImage:normalImage forState:UIControlStateNormal];
        [self addSubview:btn];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSUInteger count = self.subviews.count;
    
    CGFloat x = 0;
    CGFloat y = 0;
    NSInteger column = 3;
    CGFloat btnWH = 74;
    
    CGFloat margin = (self.bounds.size.width - btnWH * column) / (column + 1);
    NSInteger currentRow = 0;
    NSInteger currentColumn = 0;
    
    for (NSInteger i = 0; i < count; i++) {
        currentColumn = i % column;
        
        currentRow = i / column;
        
        x = margin + (btnWH + margin) * currentColumn;
        y = margin + (btnWH +margin) *currentRow;
        
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
    }
    
}

- (CGPoint)getCurrentPoint:(NSSet<UITouch *>*)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

- (UIButton *)getContatinsPoint:(CGPoint)point {
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [self getCurrentPoint:touches];
    UIButton *btn = [self getContatinsPoint:point];
    
    if (btn  && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedbtns addObject:btn];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [self getCurrentPoint:touches];
    self.currentPoint = point;
    UIButton *btn = [self getContatinsPoint:point];
    
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedbtns addObject:btn];
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableString *password = @"".mutableCopy;
    for (UIButton *btn in self.selectedbtns) {
        btn.selected = NO;
        [password appendFormat:@"%@", @(btn.tag)];
    }
    [self.selectedbtns removeAllObjects];
    [self setNeedsDisplay];
    NSLog(@"password--> %@ ", password);
}

- (void)drawRect:(CGRect)rect {
    if (self.selectedbtns.count) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        UIButton *firstBtn = self.selectedbtns.firstObject;
        
        for (UIButton *btn in self.selectedbtns) {
            if ([btn isEqual:firstBtn]) {
                [path moveToPoint:btn.center];
            } else {
                [path addLineToPoint:btn.center];
            }
        }
        [[UIColor redColor] set];
        [path setLineWidth:10];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineCapStyle:kCGLineCapRound];
        //添加一根线到当前手指所在点
        [path addLineToPoint:self.currentPoint];
        [path stroke];
    }
}
@end
