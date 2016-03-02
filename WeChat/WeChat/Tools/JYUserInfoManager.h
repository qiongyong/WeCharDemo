/*======================用户信息管理类================*/

/*=================================================*/

#import <Foundation/Foundation.h>

@interface JYUserInfoManager : NSObject

/**
 *  是否已经登录
 */
@property (nonatomic,assign) BOOL isLogin;

/**
 *  是否打开了会话环境
 */
@property (nonatomic,assign) BOOL isOpenIM;

//单例方法
+ (JYUserInfoManager *)shareManager;

/**
 *  用户名
 *
 *  @return 返回一个字符串
 */
- (NSString *)userName;

/**
 *  微信号
 *
 *  @return 返回一个ID
 */
- (NSString *)wxID;

/**
 *  用户头像网址
 *
 *  @return 返回一个字符串网址
 */
- (NSString *)avaterUrl;

/**
 *  性别 默认是男
 */
- (BOOL)sex;

/**
 *  个性签名
 *
 *  @return 返回个性签名的字符串
 */
- (NSString *)sign;

/**
 *  真正用来登录的id
 *
 *  @return 返回字符串
 */
- (NSString *)mid;



@end
