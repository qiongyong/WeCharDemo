/*=============================弹出视图=====================*/

/*=============================这是个工具类==================*/
#import <UIKit/UIKit.h>
@class JYChangeAvaterView;
@protocol JYChangeViewDelegate <NSObject>

/**
 *  代理方法 获得弹出视图上的按钮
 *
 *  @param changView 当前视图
 *  @param btn       按钮
 */
- (void)changView:(JYChangeAvaterView *)changView selectleBtn:(UIButton *)btn;

@end



@interface JYChangeAvaterView : UIView

/**
 *  弹出的view
 */
@property (nonatomic,strong) UIView *popView;

/**
 *  默认的tag 值是50000
 */
@property (nonatomic) NSInteger thisTag;


@property (nonatomic,weak) id<JYChangeViewDelegate>delegate;

/**
 *  初始化方法
 *
 *  @param frame  位置大小
 *  @param btnArr 按钮标题数组
 */
- (instancetype)initWithFrame:(CGRect)frame andBtnArr:(NSArray *)btnArr;

/**
 * 显示
 */
- (void)show;

/**
 *  隐藏
 */
- (void)hide;
@end
