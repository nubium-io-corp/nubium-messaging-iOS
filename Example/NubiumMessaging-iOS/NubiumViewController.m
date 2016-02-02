//
//  NubiumViewController.m
//  NubiumMessaging-iOS
//
//  Copyright (c) 2016 IBT. All rights reserved.
//

#import "NubiumViewController.h"

@interface NubiumViewController ()

@end

@implementation NubiumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Instantiate Messaging Client
    ortcClient = [OrtcClient ortcClientWithConfig:self];
    
    // Set connection properties
    [ortcClient setConnectionMetadata:@"clientConnMeta"];
    [ortcClient setClusterUrl:@"http://ortc-prd.nubium.io/server/2.1/"];
    
    // Connect
    [ortcClient connect:@"7GqQV1"
    authenticationToken:@"myAuthenticationToken"];
}

- (void) onConnected:(OrtcClient*) ortc
{
    // Messaging client is connected
    
    onMessage = ^(OrtcClient* ortc, NSString* channel, NSString* message) {
        // Received message 'message' at channel 'channel'
    };
    
    // Subscribe messaging channel "myChannel"
    [ortcClient  subscribe:@"myChannel"
    subscribeOnReconnected:YES
                 onMessage:onMessage];
}

- (void) onSubscribed:(OrtcClient*) ortc channel:(NSString*) channel
{
    // Subscribed to the channel 'channel'
    // Send a message to the channel 'channel'
    [ortcClient send:channel message:@"Hello world"];
}

- (void) onException:(OrtcClient*) ortc error:(NSError*) error
{
    // Exception occurred
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
