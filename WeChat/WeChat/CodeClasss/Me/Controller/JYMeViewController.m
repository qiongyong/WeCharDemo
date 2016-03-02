#import "JYMeViewController.h"
#import "JYChangeAvaterView.h"
#import "JYPersonCell.h"
#import "JYPersonModel.h"

@interface JYMeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

/**
 *  数据数组(标题)
 */
@property (nonatomic,strong) NSArray *dataArr;

/**
 *  图片标题数组(图片名)
 */
@property (nonatomic,strong) NSArray *imgArr;

@property (nonatomic,strong) JYPersonModel *model;

@end

@implementation JYMeViewController

//懒加载UITableView
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"PersonCell"];
        
        //调整下分割线位置
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark 在视图将要出现的时候准备数据
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self preData];
}

//准备数据
- (void)preData
{
    _dataArr = @[@[@""],
                 @[@"相册",@"收藏",@"钱包"],
                 @[@"表情"],
                 @[@"设置"]
                 ];
    
    _imgArr = @[@[@""],
                @[@"me_photo",@"me_collect",@"me_money"],
                @[@"me_smail"],
                @[@"me_setting"]
                ];
    
    _model = [[JYPersonModel alloc]init];
    _model.nickName = @"qiongyong";
    _model.weID = @"89358173@qq.com";
    
    if (_tableView) {
        [_tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
}

#pragma mark UITableViewDataSource
//分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}

//每组有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowArr = _dataArr[section];
    return rowArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//第一组是自定义的cell
        JYPersonCell *cell = [[JYPersonCell alloc]init];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
        //右侧小箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
   
}

#pragma mark 养成习惯在cell即将显示的时候处理数据 这样可以稍微提高cell的滑动速度
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        JYPersonCell *Personcell = (JYPersonCell *)cell;//强制转换
        [Personcell setModel:_model];
    }else{
        cell.imageView.image = [UIImage imageNamed:_imgArr[indexPath.section][indexPath.row]];
        cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    }
}

//设置row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return WGiveHeight(87);
    }
    return WGiveHeight(43);
}

//设置头部视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return WGiveHeight(15);
    }
    return WGiveHeight(10);
}

//设置尾部视图的方法
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return WGiveHeight(10);
}

#pragma mark 选中cell的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //个人中心
        if (indexPath.row == 0) {
            //暂时不实现
            NSLog(@"点击了个人中心");
        }
    }
}
@end
