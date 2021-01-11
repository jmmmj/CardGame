//
//  JMJCards.h
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class cards;


@interface JMJCard : NSObject

@property (nonatomic,copy)NSString* cardImage;
@property (nonatomic,copy)NSString* label;

+(instancetype)cardsWithDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
