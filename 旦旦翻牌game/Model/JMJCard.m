//
//  JMJCards.m
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import "JMJCard.h"

@implementation JMJCard

+ (instancetype)cardsWithDict:(NSDictionary *)dict
{
    JMJCard *card = [[self alloc]init];
    card.cardImage = dict[@"cardImage"];
    card.label = dict[@"cardImage"];
    return card;
    
}

@end
