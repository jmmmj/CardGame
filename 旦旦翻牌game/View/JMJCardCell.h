//
//  JMJCardCell.h
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import <UIKit/UIKit.h>
#import "JMJCard.h"
NS_ASSUME_NONNULL_BEGIN

@interface JMJCardCell : UICollectionViewCell

@property(nonatomic,strong)JMJCard *card;

-(void)turnOver;

@end

NS_ASSUME_NONNULL_END
