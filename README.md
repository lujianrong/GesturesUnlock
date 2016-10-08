# GesturesUnlock
手势解锁 &amp;&amp; 小小的模仿Masonry 用链式编程思想，写个设置frame的类目



 GesturesUnlock *lockView = [[GesturesUnlock alloc] init];
 lockView.bk_w(300).bk_h(300).bk_center(self.view.center);


- (UIView *(^)(CGFloat))bk_x {
    return ^(CGFloat x){
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}
