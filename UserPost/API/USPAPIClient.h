//
//  USPAPIClient.h
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

static NSString *kUSPBaseUrl = @"https://mobile-code-test.ifactornotifi.com/json";

typedef void (^USPEmptyBlock)();
typedef void (^USPGenericBlock)(id JSON);
typedef void (^USPErrorBlock)(NSError *error);

@class Post;

@interface USPAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)modifyPostWithPost:(Post *)post
            modifyPostType:(ModifyPostType)modifyPostType
                   success:(USPEmptyBlock)success
                   failure:(USPErrorBlock)failure;

@end
