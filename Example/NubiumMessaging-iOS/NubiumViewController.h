//
//  NubiumViewController.h
//  NubiumMessaging-iOS
//
//  Copyright (c) 2016 IBT. All rights reserved.
//

@import UIKit;
#import "OrtcClient.h"

@interface NubiumViewController : UIViewController
{
@private
    OrtcClient* ortcClient;
    void (^onMessage)(OrtcClient* ortc, NSString* channel, NSString* message);
}
@end
