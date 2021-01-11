//
//  JMJdandanCollectionViewController.m
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import "JMJdandanController.h"

#import "JMJCardCell.h"
@interface JMJdandanController ()

@property (nonatomic,strong)NSArray * cards;

@property (nonatomic,weak)JMJCardCell * selectedCard1;
@property (nonatomic,weak)JMJCardCell * selectedCard2;

@end

@implementation JMJdandanController

static NSString * const reuseIdentifier = @"card_cell";

-(NSArray*)cards
{
    if(!_cards)
    {
        //获取文件路径
        NSString *path=[[NSBundle mainBundle]pathForResource:@"cardsList" ofType:@"json"];
        //文件转化成data
        NSData *data = [NSData dataWithContentsOfFile:path];
        //data转化成array
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //初始化可变数组
        NSMutableArray *array = [NSMutableArray array];
        //遍历临时数组，获取字典
        for(NSDictionary *dict in tempArray){
            //字典转模型
            JMJCard *p=[JMJCard cardsWithDict:dict];
            //模型添加到可变数组当中
            [array addObject:p];
        }
        //赋值
        _cards=array;
    }
    return _cards;
}



-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self=[super initWithCollectionViewLayout:layout];
    return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    UICollectionViewFlowLayout *layout2 = [[UICollectionViewFlowLayout alloc]init];
    self=[super initWithCollectionViewLayout:layout2];
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 流水布局:调整cell尺寸
    UICollectionViewFlowLayout *layout = ({
            
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(jmjScreenWidth/4-20,jmjScreenWidth/4-20);//每一个cell的大小
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
//            CGFloat margin = (jmjScreenWidth - 160) *0.5;
        layout.sectionInset = UIEdgeInsetsMake(10,10,10,10);//四周的边距
            //设置最小边距
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
            
        layout;
    });
        
        
    UICollectionView *collectionV = ({
            
        UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, jmjScreenWidth, jmjScreenHeight) collectionViewLayout:layout];
        
        collectionV.backgroundColor = [UIColor whiteColor];
        collectionV.dataSource = self;

//        [self.view addSubview:collectionV];
        collectionV;
    });
    self.collectionView = collectionV;
//    [collectionV registerNib:[UINib nibWithNibName:@"JMJProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [collectionV registerClass:[JMJCardCell class] forCellWithReuseIdentifier:reuseIdentifier];
       
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMJCardCell * cardCell= self.collectionView.visibleCells[indexPath.row];
    [cardCell turnOver];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.cards.count;
    return 20;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JMJCardCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.card = self.cards[indexPath.row];
    return cell;
}



@end
