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

- (void)getUsersWithSuccess:(USPGenericBlock)success
                    failure:(USPErrorBlock)failure {
    [self GET:@"users" params:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *users = [MTLJSONAdapter modelsOfClass:[User class] fromJSONArray:responseObject error:nil];
        success(users);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
