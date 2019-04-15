//
//  JCSCountryController.h
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCSCountry;

NS_SWIFT_NAME(CountryController)
NS_ASSUME_NONNULL_BEGIN

@interface JCSCountryController : NSObject

-(instancetype)init;

@property (nonatomic, readonly) NSArray<JCSCountry *> *countries;
- (void)fetchCountryByName:(NSString *)name completion:(void (^)(NSError *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
