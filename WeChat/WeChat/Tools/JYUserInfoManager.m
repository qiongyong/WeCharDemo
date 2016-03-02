//
//  JYUserInfoManager.m
//  WeChat
//
//  Created by lanou on 16/3/2.
//  Copyright © 2016年 叶建勇. All rights reserved.
//

#import "JYUserInfoManager.h"

@implementation JYUserInfoManager

+ (JYUserInfoManager *)shareManager
{
    static JYUserInfoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JYUserInfoManager alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        _isLogin = NO;//一开始肯定是没有登录的
        _isOpenIM = NO;//以开水肯定是没有打开聊天的
    }
    return self;
}

- (NSString *)userName
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:wUserInfo];
    return dic[@"nickName"];
}

- (NSString *)wxID
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"wxID"];
}

- (NSString *)avaterUrl
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"avaterUrl"];
}

- (BOOL)sex
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return [dic[@"sex"]boolValue];
}

- (NSString *)sign
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"sign"];
}

- (NSString *)mid
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"mid"];
}


@end
