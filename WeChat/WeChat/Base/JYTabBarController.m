#import "JYTabBarController.h"
#import "JYAddressBookViewController.h"
#import "JYChatViewController.h"
#import "JYFoundViewController.h"
#import "JYMeViewController.h"
#import "UIImage+JYImage.h"

@interface JYTabBarController ()

@end

@implementation JYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JYChatViewController *chat = [[JYChatViewController alloc]init];
    chat.title = @"微信";
    
    JYAddressBookViewController *addressBook = [[JYAddressBookViewController alloc]init];
    addressBook.title = @"通讯录";
    
    JYFoundViewController *found = [[JYFoundViewController alloc]init];
    found.title = @"发现";
    
    JYMeViewController *me = [[JYMeViewController alloc]init];
    me.title = @"我";
    
    self.viewControllers = @[[self giveMeNavWithVC:chat
                                        andImgName:@"tabbar_chat_no"
                                  andSelectImgName:@"tabbar_chat_yes"],
                             [self giveMeNavWithVC:addressBook
                                        andImgName:@"tabbar_book_no"
                                  andSelectImgName:@"tabbar_book_yes"],
                             [self giveMeNavWithVC:found
                                        andImgName:@"tabbar_found_no"
                                  andSelectImgName:@"tabbar_found_yes"],
                             [self giveMeNavWithVC:me
                                        andImgName:@"tabbar_me_no"
                                  andSelectImgName:@"tabbar_me_yes"]];
}



/**
 *  快速创建导航栏的方法
 *
 *  @param VC            控制器
 *  @param imgName       默认图片
 *  @param selectImgName 选中图片
 *
 *  @return 返回一个带导航控制器的控制器视图
 */
- (UINavigationController *)giveMeNavWithVC:(UIViewController *)VC andImgName:(NSString *)imgName andSelectImgName:(NSString *)selectImgName
{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];

    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:VC.title image:[UIImage imageWithOriginalImageName:imgName] selectedImage:[UIImage imageWithOriginalImageName:selectImgName]];
    
    return nav;
}
@end
