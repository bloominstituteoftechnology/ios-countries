//
//  JCSCountry.m
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSCountry.h"

@implementation JCSCountry

- (instancetype)initWithName:(NSString *)name region:(NSString *)region capital:(NSString *)capital population:(NSInteger)population currencies:(NSArray *)currencies languages:(NSArray *)languages flag:(NSString *)flag {
    
    self = [super init];
    if (self) {
        _name = name;
        _region = region;
        _capital = capital;
        _population = population;
        _currencies = currencies;
        _languages = languages;
        _flag = flag;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"name"];
    NSString *region = dictionary[@"region"];
    NSString *capital = dictionary[@"capital"];
    NSString *flag = dictionary[@"flag"];
    
    NSObject *popObject = dictionary[@"population"];
    NSInteger population = -1;
    
    if ([popObject isKindOfClass: [NSNumber class]]) {
        NSNumber *popNumber = (NSNumber *)popObject;
        population = [popNumber integerValue];
    } else if ([popObject isKindOfClass: [NSString class]]) {
        NSString *popString = (NSString *)popObject;
        population = [popString integerValue];
    }
    
    NSArray *currencyArray = dictionary[@"currencies"];
    NSMutableArray *currencies = [[NSMutableArray alloc] init];
    for (NSDictionary *currencyDict in currencyArray) {
        NSString *code = currencyDict[@"code"];
        [currencies addObject:code];
    }
    
    NSArray *languageArray = dictionary[@"languages"];
    NSMutableArray *languages = [[NSMutableArray alloc] init];
    for (NSDictionary *languagesDict in languageArray) {
        NSString *languageName = languagesDict[@"name"];
        [languages addObject:languageName];
    }
    
    return [self initWithName:name region:region capital:capital population:population currencies:currencies languages:languages flag:flag];
}

@end
