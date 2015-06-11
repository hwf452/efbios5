//
//  YYHTTPSRequest.h
//  efbios5
//
//  Created by shichangshichang on 14/11/25.
//  Copyright (c) 2014年 edao. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void (^completionHandler)(NSURLResponse *, NSData *, NSError *);

@interface YYHTTPSRequest : NSObject<NSURLConnectionDataDelegate>
{
    NSOperationQueue *_requestOperationQueue;
}

@property (nonatomic) NSURL * url;
@property (nonatomic, copy) NSString * method;
@property (nonatomic) NSData * body;

@property (nonatomic, copy) NSDictionary * headers;
@property (nonatomic, copy) NSDictionary * parameters;
@property (nonatomic, copy) void (^ completionHandler)(NSURLResponse *, NSData *, NSError *);
@property (nonatomic, copy) NSString * contentType;
@property (nonatomic, copy) NSString * userAgent;
@property (nonatomic) NSURLResponse * response;
@property (nonatomic) NSMutableData * responseData;
@property (nonatomic,strong)NSURLConnection *connection;
//- (instancetype)initWithUrl:(NSURL *)url;

-(id)initWithUrl:(NSURL *)url;

- (void)loadWithCompletion:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler;
- (void)loadRequest;
- (NSMutableURLRequest *)urlRequest;
- (NSString *)queryString;
- (void)connection:(NSURLConnection *)_ error:(NSError *)error;
- (void)connection:(NSURLConnection *)_ didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)_ didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)_;


@end

