//
//  ViewController.m
//  watchnorris
//
//  Created by Charlie Nowacek on 2/18/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import "TLTJokeViewController.h"
#import "TLTApiClient.h"
#import "TLTJoke.h"

@interface TLTJokeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;
@property (nonatomic, strong)   TLTApiClient *client;

@end

@implementation TLTJokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.client = [[TLTApiClient alloc] init];
    
    if (self.joke && self.joke.joke.length) {
        [self updateViews];
    } else if (self.joke && self.joke.jokeId) {
        [self fetchJokeWithId:self.joke.jokeId];
    } else {
        [self fetchRandomJoke];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedJoke:) name:@"WatchKitSaysHi" object:nil];
}

- (void)updateViews {
    self.jokeLabel.text = self.joke.unescapedJoke;
}

- (IBAction)fetchButtonPressed:(id)sender {
    [self fetchRandomJoke];
}

- (void)receivedJoke:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    TLTJoke *joke = [TLTJoke instanceFromDictionary:userInfo[JokeModelName]];
    
    self.joke = joke;
    [self updateViews];
}

#pragma mark - API Methods

- (void)fetchRandomJoke {
    [self.client getRandomJoke:^(TLTJoke *joke, NSError *error) {
        if (error) {
            // Do error things
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        self.joke = joke;
        [self updateViews];
    }];
}

- (void)fetchJokeWithId:(NSNumber *)jokeId {
    [self.client getJokeWithID:jokeId completion:^(TLTJoke *joke, NSError *error) {
        if (error) {
            // Do error things
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        self.joke = joke;
        [self updateViews];
    }];
}

@end
