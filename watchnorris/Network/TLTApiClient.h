//
//  TLTApiClient.h
//  watchnorris
//
//  Created by Charlie Nowacek on 2/18/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLTJoke;

/**
 * The ApiClient is used for communicating with the Chuck Norris service (http://api.icndb.com).  
 */
@interface TLTApiClient : NSObject

/**
 * Fetches a random Chuck Norris joke
 * @param completionHandler The completion block that's called after the request is completed. 
 */
- (void)getRandomJoke:(void (^)(TLTJoke *joke, NSError *error))completionHandler;

@end
