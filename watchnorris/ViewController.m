//
//  ViewController.m
//  watchnorris
//
//  Created by Charlie Nowacek on 2/18/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import "ViewController.h"
#import "TLTApiClient.h"
#import "TLTJoke.h"

@interface ViewController ()

@property (nonatomic, strong)   TLTApiClient *client;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [[TLTApiClient alloc] init];
    [self fetchJoke];
}

- (void)fetchJoke {
    [self.client getRandomJoke:^(TLTJoke *joke, NSError *error) {
        if (error) {
            // Do error things
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        NSLog(@"Joke: %@", joke.unescapedJoke);
    }];
}

@end