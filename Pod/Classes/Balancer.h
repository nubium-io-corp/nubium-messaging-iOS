//
//  Balancer.h
//  OrtcClient
//
//  Created by Nubium.
//
//

#import <Foundation/Foundation.h>

@interface Balancer : NSObject

- initWithCluster:(NSString*) aCluster serverUrl:(NSString*)url isCluster:(BOOL)isCluster appKey:(NSString*) anAppKey callback:(void (^)(NSString *aBalancerResponse))aCallback;

@end
