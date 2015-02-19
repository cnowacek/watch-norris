//
// Created by Charlie Nowacek on 2/18/15.
// Copyright (c) 2015 Tilt. All rights reserved.
//

#import "TLTJoke.h"
#import "NSString+HTML.h"

@implementation TLTJoke

+ (instancetype)instanceFromDictionary:(NSDictionary *)dictionary {
    TLTJoke *joke = [[TLTJoke alloc] init];
    [joke setPropertiesFromDictionary:dictionary];
    return joke;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mDictionary = [NSMutableDictionary dictionary];
    
    if (self.categories) {
        mDictionary[JokeCategoriesKey] = self.categories;
    }
    
    if (self.jokeId) {
        mDictionary[JokeIdKey] = self.jokeId;
    }
    
    if (self.joke) {
        mDictionary[JokeJokeKey] = self.joke;
    }
    
    return mDictionary;
}

- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary {
    self.categories = dictionary[JokeCategoriesKey];
    self.jokeId = dictionary[JokeIdKey];
    self.joke = dictionary[JokeJokeKey];
}

- (NSString *)unescapedJoke {
    if ([self.joke respondsToSelector:@selector(stringByUnescapingFromHTML)]) {
        return [self.joke stringByUnescapingFromHTML];
    }
    return nil;
}

@end