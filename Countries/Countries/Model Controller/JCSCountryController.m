//
//  JCSCountryController.m
//  Countries
//
//  Created by Lambda_School_Loaner_95 on 4/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSCountryController.h"
#import "JCSCountry.h"

static NSString *baseURLString = @"https://restcountries.eu/rest/v2/name/";

@interface JCSCountryController ()
@property (nonatomic, copy) NSMutableArray *internalCountries;

@end

@implementation JCSCountryController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalCountries = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchCountryByName:(NSString *)name completion:(void (^)(NSError * _Nullable))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *countryURL = [baseURL URLByAppendingPathComponent:name.lowercaseString];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:countryURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching countries: %@", error);
            completion(error);
            return;
        }
        NSError *jsonError;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (!array) {
            NSLog(@"Error decoding: %@", error);
            completion(error);
            return;
        }
        
        NSMutableArray *countries = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dict in array) {
            JCSCountry *country = [[JCSCountry alloc] initWithDictionary:dict];
            [countries addObject:country];
        }
        self.internalCountries = countries;
        completion(nil);
        
    }];
    [task resume];
    
    
    
}

- (NSArray<JCSCountry *> *)countries {
    return self.internalCountries;
}


@end
