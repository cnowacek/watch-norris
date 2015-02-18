//
// Created by Charlie Nowacek on 2/18/15.
// Copyright (c) 2015 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

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
 * Sets the properties for a Joke given a dictionary of key/value pairs
 * @param dictionary The key/value pairs that represent a Joke object's properties
 */
- (void)setPropertiesFromDictionary:(NSDictionary *)dictionary;

/**
 * Returns the joke string property that has been unescaped of any 
 * HTML entities. (e.g. &amp; -> &, &quot; -> ")
 * @return The unescaped joke string
 * @discussion It's advised to use this property when displaying the joke string 
 * to a user since the API will escape certain characters in the raw joke property.
 */
- (NSString *)unescapedJoke;

@end