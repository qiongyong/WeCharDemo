#import <UIKit/UIKit.h>
@class JYPersonModel;

@interface JYPersonCell : UITableViewCell

/**
 *  数据模型类
 */
@property (nonatomic,strong) JYPersonModel *model;

/**
 *  用户头像类
 */
@property (nonatomic,strong) UIImageView *avaterImage;

/**
 *  用户名Label
 */
@property (nonatomic,strong) UILabel *userNameLabel;

/**
 *  微信号Label
 */
@property (nonatomic,strong) UILabel *weIDLabel;

/**
 *  二维码图片
 */
@property (nonatomic,strong) UIImageView *wmImageView;

@end
