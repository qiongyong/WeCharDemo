
#import "UIImage+JYImage.h"

@implementation UIImage (JYImage)
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    
    //创建一个图形上下文形象
    UIGraphicsBeginImageContext(newSize);
    
    //告诉旧图片画在这个新的环境,所需的大小
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    //从图形上下文得到新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
