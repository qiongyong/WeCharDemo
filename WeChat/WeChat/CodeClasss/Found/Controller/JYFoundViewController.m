#import "JYFoundViewController.h"

@interface JYFoundViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

/**
 *  名字数组
 */
@property (nonatomic,strong) NSArray *NameArray;

/**
 *  图片数组
 */
@property (nonatomic,strong) NSArray *imageArray;
@end



@implementation JYFoundViewController

//懒加载UITableView
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FoundCell"];
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);//调整下分割线位置
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark 准备数据
- (void)preData
{
  
    _NameArray = @[@[@"朋友圈"],
                 @[@"扫一扫",@"摇一摇"],
                 @[@"附近的人"],
                 @[@"购物",@"游戏"]
                 ];
    
    _imageArray = @[@[@"found_quan"],
                @[@"found_saoyisao",@"found_yao"],
                @[@"found_nearby"],
                @[@"found_shop",@"found_game"]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self preData];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //有几个分组
    return _NameArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //每个分组有几行
    NSArray *rowArr = _NameArray[section];
    return rowArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoundCell" forIndexPath:indexPath];
    //添加小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark 养成习惯在willDisplayCell中处理数据 这个方法是将要展示视图的时候处理数据
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.section][indexPath.row]];
    cell.textLabel.text = _NameArray[indexPath.section][indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return WGiveHeight(43);
}

#pragma mark 设置头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return WGiveHeight(15);
    }
    return WGiveHeight(10);
}
#pragma mark 设置尾部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return WGiveHeight(10);
}
@end
