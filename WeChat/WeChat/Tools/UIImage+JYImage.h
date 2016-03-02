/*================================给图片加的分类*/
#import <UIKit/UIKit.h>

@interface UIImage (JYImage)

/**
 *  防止图片被渲染
 *
 *  @param imageName 图片名
 *
 *  @return 返回一张没被渲染过的图片 原始图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

/**
 *  压缩图片方法
 *
 *  @param image   原始图片
 *  @param newSize 压缩后的大小
 *
 *  @return 返回一张压缩后的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
