#import "JYPersonCell.h"
#import "JYPersonModel.h"

@implementation JYPersonCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.avaterImage];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.weIDLabel];
        [self.contentView addSubview:self.wmImageView];
    }
    return self;
}

#pragma mark 给数据模型类赋值
- (void)setModel:(JYPersonModel *)model
{
    _model = model;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//小箭头
    
    self.avaterImage.image = [UIImage imageNamed:@"me_wm"];//暂时这样放着先
    
    self.userNameLabel.text = model.nickName;
    self.weIDLabel.text = [NSString stringWithFormat:@"微信号: %@",model.weID];
    
    self.wmImageView.image = [UIImage imageNamed:@"me_wm"];
}


#pragma mark 将全部控件懒加载
//头像
- (UIImageView *)avaterImage
{
    if (!_avaterImage) {
        _avaterImage = ({
            UIImageView * avaterImgView = [[UIImageView alloc]initWithFrame:CGRectMake(WGiveWidth(12), WGiveHeight(12), self.frame.size.height - 2*WGiveHeight(12), self.frame.size.height - 2*WGiveHeight(12))];
            
            avaterImgView.clipsToBounds = YES;
            
            //加点圆角
            avaterImgView.layer.cornerRadius = 3;
            
            avaterImgView;
        });
    }
    return _avaterImage;
}

//用户名
- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = ({
            UILabel *userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height - 2*WGiveHeight(12) + 2*WGiveWidth(12), WGiveHeight(19), WGiveWidth(160), WGiveHeight(22))];
            userNameLabel.font = [UIFont systemFontOfSize:15];
            
            userNameLabel;
        });
    }
    return _userNameLabel;
}

//用户ID
- (UILabel *)weIDLabel
{
    if (!_weIDLabel) {
        _weIDLabel = ({
            UILabel * weIDLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.height - 2*WGiveHeight(12) + 2*WGiveWidth(12), _userNameLabel.frame.origin.y + _userNameLabel.frame.size.height + WGiveHeight(5), WGiveWidth(160), WGiveHeight(20))];

            weIDLabel.font = [UIFont systemFontOfSize:12];
            
            weIDLabel;
        });
    }
    return _weIDLabel;
}

//二维码
- (UIImageView *)wmImageView
{
    if (!_wmImageView) {
        _wmImageView = ({
            UIImageView * wmImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - WGiveWidth(50),((self.frame.size.height - WGiveHeight(35/2.0))/2.0), WGiveWidth(35/2.0), WGiveWidth(35/2.0))];
            
            wmImgView;

        });
    }
    return _wmImageView;
}
@end
