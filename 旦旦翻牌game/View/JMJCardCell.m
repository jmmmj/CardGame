//
//  JMJCardCell.m
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import "JMJCardCell.h"

@interface JMJCardCell ()

@property (nonatomic,strong)UIImageView* imageView;
@property (nonatomic,strong)UILabel * label;
@property (nonatomic)bool isOpen;
@end

@implementation JMJCardCell

-(void)setCard:(JMJCard *)card
{
   
    _card=card;
    self.imageView.layer.cornerRadius =10;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.userInteractionEnabled = YES;
    self.imageView.image = [UIImage imageNamed:@"cardimg"];
    
    self.label.text = _card.label;
    self.isOpen = NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
       [self createSubViews];
    }
    return self;
}
- (void) createSubViews {
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, jmjScreenWidth/4-30, jmjScreenWidth/4-30)];
//    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 5)];
//    self.label.font = [UIFont systemFontOfSize:9];
//    [self addSubview:self.label];
    [self addSubview:self.imageView];
}

//每一组的偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(0, 50, 0, 0);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    self.imageView.image = [UIImage imageNamed:_card.cardImage];
//}

-(void)turnOver
{
    if(self.isOpen==NO){
        self.isOpen=YES;
        self.imageView.image = [UIImage imageNamed:_card.cardImage];
    }else{
        self.isOpen=NO;
        self.imageView.image = self.imageView.image = [UIImage imageNamed:@"cardimg"];
    }
    
}

@end
