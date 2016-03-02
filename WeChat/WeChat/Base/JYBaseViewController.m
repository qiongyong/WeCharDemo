#import "JYBaseViewController.h"

@interface JYBaseViewController ()

@end

@implementation JYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark 将父类的状态栏的样式改为白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
