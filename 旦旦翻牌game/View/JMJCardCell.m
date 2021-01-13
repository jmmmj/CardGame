//
//  JMJCardCell.m
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import "JMJCardCell.h"

@interface JMJCardCell ()

@property (nonatomic,strong)UIImageView* surfaceImageView;
@property (nonatomic,strong)UIImageView* backImageView;
@property (nonatomic,strong)UILabel * label;
@property (nonatomic)bool isOpen;
@end

@implementation JMJCardCell

-(void)setCard:(JMJCard *)card
{
   
    _card=card;
    // 设置阴影
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowOpacity = 0.3;
    //设置表面
    self.surfaceImageView.layer.cornerRadius =10;
    self.surfaceImageView.layer.masksToBounds = YES;
    self.surfaceImageView.userInteractionEnabled = YES;
    self.surfaceImageView.image = [UIImage imageNamed:_card.cardImage];
    //设置背面
    self.backImageView.layer.cornerRadius =10;
    self.backImageView.layer.masksToBounds = YES;
    self.backImageView.userInteractionEnabled = YES;
    self.backImageView.image = [UIImage imageNamed:@"cardimg"];
    self.label.text = _card.label;
    self.isOpen = NO;
}

-(NSString*)getID{
    return self.label.text;
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
    self.surfaceImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, jmjScreenWidth/4-30, jmjScreenWidth/4-30)];
    self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, jmjScreenWidth/4-30, jmjScreenWidth/4-30)];
    self.label = [[UILabel alloc]init];
//    [self.label setHidden:YES];
//    self.label.font = [UIFont systemFontOfSize:9];
//    [self addSubview:self.label];
    [self addSubview:self.surfaceImageView];
    [self.surfaceImageView setHidden:YES];
    [self addSubview:self.backImageView];
}

//每一组的偏移量
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(0, 50, 0, 0);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    self.surfaceImageView.image = [UIImage imageNamed:_card.cardImage];
//}

-(void)turnOver
{
    if(self.isOpen==NO){
        self.isOpen=YES;
        UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromLeft;
        [UIView transitionWithView:self    duration:0.5
             options:option
            animations:^ {
                [self.surfaceImageView setHidden:NO];
                [self.backImageView setHidden:YES];
            }
            completion:^(BOOL finished){
            }];
    }else{
        self.isOpen=NO;
        UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromLeft;
        [UIView transitionWithView:self    duration:0.5
             options:option
            animations:^ {
                [self.surfaceImageView setHidden:YES];
                [self.backImageView setHidden:NO];
            }
            completion:^(BOOL finished){
            }];
    }
    
}

-(void)remove
{
    UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:self    duration:0.5
         options:option
        animations:^ {
            [self.surfaceImageView setHidden:YES];
            [self.backImageView setHidden:YES];
        }
        completion:^(BOOL finished){
        }];
}

@end
