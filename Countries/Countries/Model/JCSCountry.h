//
//  JCSCountry.h
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(Country)
NS_ASSUME_NONNULL_BEGIN

@interface JCSCountry : NSObject


- (instancetype)initWithName:(NSString *)name region:(NSString  *)region capital:(NSString *)capital population:(NSInteger)population currencies:(NSArray *)currencies languages:(NSArray *)languages flag:(NSString *)flag;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *capital;
@property (nonatomic) NSInteger population;
@property (nonatomic, copy, readonly) NSArray *currencies;
@property (nonatomic, copy) NSArray *languages;
@property (nonatomic, copy) NSString *flag;

@end

NS_ASSUME_NONNULL_END
