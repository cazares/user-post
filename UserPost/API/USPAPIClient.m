//
//  USPAPIClient.m
//  UserPost
//
//  Created by Miguel Cazares on 1/11/18.
//  Copyright © 2018 Miguel Cazares. All rights reserved.
//

@import AFNetworking;

#import "USPAPIClient.h"
#import "UserPost-Swift.h"

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <Mantle/Mantle.h>

static NSString *kUsersUrl = @"users";
static NSString *kPostsUrl = @"posts";

@interface USPAPIClient ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;

@end

@implementation USPAPIClient

+ (instancetype)sharedClient {
    static USPAPIClient *_sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[USPAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kUSPBaseUrl]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer = [[AFJSONResponseSerializer alloc] init];
        _sharedClient.operationManager = [AFHTTPRequestOperationManager manager];
        _sharedClient.operationManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedClient.operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    return _sharedClient;
}

- (void)GET:(NSString *)url params:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.operationManager GET:[NSString stringWithFormat:@"%@/%@", kUSPBaseUrl, url] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)POST:(NSString *)url params:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.operationManager POST:[NSString stringWithFormat:@"%@/%@", kUSPBaseUrl, url] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)PUT:(NSString *)url params:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.operationManager PUT:[NSString stringWithFormat:@"%@/%@", kUSPBaseUrl, url] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

- (void)DELETE:(NSString *)url params:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [self.operationManager DELETE:[NSString stringWithFormat:@"%@/%@", kUSPBaseUrl, url] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
}

/*- (void)getUsersWithSuccess:(USPGenericBlock)success
                    failure:(USPErrorBlock)failure {
    [self GET:kUsersUrl params:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSLog(@"users: %@", responseObject);
        NSArray *users = [MTLJSONAdapter modelsOfClass:[User class] fromJSONArray:responseObject error:&error];
        NSLog(@"%@", error);
        success(users);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}*/

- (void)getPostsWithUserId:(NSInteger)userId
                   success:(USPGenericBlock)success
                    failure:(USPErrorBlock)failure {
    NSDictionary *params = @{ @"userId": @(userId) };
    
    [self GET:kPostsUrl params:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *posts = [MTLJSONAdapter modelsOfClass:[Post class] fromJSONArray:responseObject error:nil];
        success(posts);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)modifyPostWithPost:(Post *)post
            modifyPostType:(ModifyPostType)modifyPostType
                   success:(USPEmptyBlock)success
                   failure:(USPErrorBlock)failure {
    NSDictionary *params = @{ @"title": @"",//post.title,
                              @"body": @"" };//post.body };
    NSString *url = kPostsUrl;
    if (modifyPostType != CreateNew) {
        url = [NSString stringWithFormat:@"%@/%ld", kPostsUrl, @(1)];//post.id];
    }
    
    if (modifyPostType == CreateNew) {
        [self POST:url params:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success();
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
    }
    else if (modifyPostType == Edit) {
        [self PUT:url params:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success();
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
    }
    else {
        // doing else instead of else if to avoid being locked into a spinner
        [self DELETE:url params:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            success();
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
    }
}

@end
