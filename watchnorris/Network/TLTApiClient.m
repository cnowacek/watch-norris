//
//  TLTApiClient.m
//  watchnorris
//
//  Created by Charlie Nowacek on 2/18/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import "TLTApiClient.h"
#import "TLTJoke.h"

static NSString * const ApiJSONValueKey = @"value";

static NSString * const ApiBaseUrlString = @"http://api.icndb.com";
static NSString * const ApiRandomJokePathString = @"jokes/random?exclude=[explicit]";

@interface TLTApiClient ()

@property (nonatomic, strong) NSURL *baseUrl;

@end

@implementation TLTApiClient

- (instancetype)init {
    self = [super init];
    if (self) {
        _baseUrl = [[NSURL alloc] initWithString:ApiBaseUrlString];
    }
    return self;
}

- (void)getRandomJoke:(void (^)(TLTJoke *joke, NSError *error))completionHandler {
    NSURL *url = [NSURL URLWithString:ApiRandomJokePathString relativeToURL:self.baseUrl];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completionHandler(nil, error);
            return;
        }
        NSError *jsonError = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completionHandler(nil, jsonError);
            return;
        }

        TLTJoke *joke = [TLTJoke instanceFromDictionary:json[ApiJSONValueKey]];
        completionHandler(joke, nil);
    }] resume];
}

@end
