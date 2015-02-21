//
// Created by Charlie Nowacek on 2/18/15.
// Copyright (c) 2015 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const JokeModelName = @"joke";

static NSString * const JokeCategoriesKey = @"categories";
static NSString * const JokeIdKey = @"id";
static NSString * const JokeJokeKey = @"joke";

/**
 * Holds a Joke object
 */
@interface TLTJoke : NSObject

@property (nonatomic, copy) NSArray *categories;
@property (nonatomic, copy) NSNumber *jokeId;
@property (nonatomic, copy) NSString *joke;

/**
 * Creates a Joke model object from a dictionary of properties.
 * @param dictionary The key/value pairs that represent a Joke object 
 * @return An instance of a Joke model object.
 */
+ (instancetype)instanceFromDictionary:(NSDictionary *)dictionary;

/**
 * Creates a dictionary object that represents a Joke object.
 * @return A dictionary with key/value pairs that represent a Joke object
 */
- (NSDictionary *)dictionaryRepresentation;

/**
 * Returns the joke string property that has been unescaped of any 
 * HTML entities. (e.g. &amp; -> &, &quot; -> ")
 * @return The unescaped joke string
 * @discussion It's advised to use this property when displaying the joke string 
 * to a user since the API will escape certain characters in the raw joke property.
 */
- (NSString *)unescapedJoke;

@end