//
//  InterfaceController.m
//  watchnorris WatchKit Extension
//
//  Created by Charlie Nowacek on 2/20/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import "InterfaceController.h"
#import "TLTApiClient.h"
#import "TLTJoke.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *jokeLabel;
@property (nonatomic, strong)   TLTApiClient *apiClient;

@property (nonatomic, strong)   TLTJoke *joke;

@end


@implementation InterfaceController

- (instancetype)init {
    self = [super init];
    if (self) {
        _apiClient = [[TLTApiClient alloc] init];
    }
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self fetchRandomJoke];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)updateViews {
    self.jokeLabel.text = [self.joke unescapedJoke];
}

#pragma mark - Helper methods

- (void)fetchRandomJoke {
    [self.apiClient getRandomJoke:^(TLTJoke *joke, NSError *error) {
        if (error) {
            // Do error things
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        self.joke = joke;
        [self updateViews];
    }];
}

- (void)openJokeInApp:(TLTJoke *)joke {
    NSDictionary *userInfo = @{JokeModelName:[joke dictionaryRepresentation]};
    [WKInterfaceController openParentApplication:userInfo reply:nil];
}

#pragma mark IBOutlet Methods

- (IBAction)fetchButtonPressed {
    [self fetchRandomJoke];
}

- (IBAction)openButtonPressed {
    [self openJokeInApp:self.joke];
    
}

@end



