//
//  JYChangeAvaterView.m
//  WeChat
//
//  Created by lanou on 16/3/2.
//  Copyright © 2016年 叶建勇. All rights reserved.
//

#import "JYChangeAvaterView.h"

@interface JYChangeAvaterView (){
    CGFloat _height;
}

@end

@implementation JYChangeAvaterView

- (instancetype)initWithFrame:(CGRect)frame andBtnArr:(NSArray *)btnArr
{
    if (self = [super initWithFrame:frame]) {
        _thisTag = 50000;
        _height = 0;
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.userInteractionEnabled = YES;//开启用户交互
        
        //这个的作用是点击这个view的时候将它隐藏掉(销毁掉)
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [control addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:control];
        [self createPopViewWithArr:btnArr];
    }
    return self;
}

#pragma mark 创建按钮数组
- (void)createPopViewWithArr:(NSArray *)arr
{
    _height = WGiveHeight(48* (arr.count + 1)) + WGiveHeight(5);
    
    _popView = ({
        UIView *popView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, _height)];
        popView.backgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:231/255.0 alpha:1];
        popView;
    });
    
    [self addSubview:self.popView];
    
    //添加按钮
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, i * WGiveHeight(48), self.frame.size.width, WGiveHeight(47));
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = _thisTag + i;
        [btn addTarget:self action:@selector(deliverValue:) forControlEvents:UIControlEventTouchDown];
        
        [_popView addSubview:btn];
    }
    
    //取消按钮
    UIButton *canceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    canceBtn.backgroundColor = [UIColor whiteColor];
    canceBtn.frame = CGRectMake(0, _height - WGiveHeight(48), self.frame.size.width, WGiveHeight(48));
    [canceBtn setTitle:@"取消" forState:UIControlStateNormal];
    [canceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [canceBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [_popView addSubview:canceBtn];
    
}

#pragma mark 其他按钮的点击方法 主要作用是将按钮传递出去
- (void)deliverValue:(UIButton *)btns
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(changView:selectleBtn:)]) {
        [self.delegate changView:self selectleBtn:btns];
    }
}

#pragma mark 显示的方法
- (void)show
{
    [UIView animateWithDuration:0.2 animations:^{
        self.popView.frame = CGRectMake(0, self.frame.size.height - _height, self.frame.size.width, _height);
    }];
}

#pragma mark 隐藏的方法
- (void)hide
{
    [UIView animateWithDuration:0.2 animations:^{
        _popView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, _height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];//移除掉
    }];
}

@end
