/*=========================Model类===================*/

#import <Foundation/Foundation.h>

@interface JYPersonModel : NSObject

/**
 *  用户头像
 */
@property (nonatomic,copy) NSString *avater;

/**
 *  用户昵称
 */
@property (nonatomic,copy) NSString *nickName;

/**
 *  微信号
 */
@property (nonatomic,copy) NSString *weID;

@end
