//
//  YYHTTPSRequest.m
//  efbios5
//
//  Created by shichangshichang on 14/11/25.
//  Copyright (c) 2014年 edao. All rights reserved.
//

#import "YYHTTPSRequest.h"

@implementation YYHTTPSRequest



-(id)initWithUrl:(NSURL *)url{
    
    self = [super init];
    
    if (self) {
        
        self=[[YYHTTPSRequest alloc] init];
        self.url=url;
        
        
        
    }
    
    return self;
    
}

- (void)loadWithCompletion:(void (^)(NSURLResponse *, NSData *, NSError *))completionHandler{
    
    self.completionHandler=completionHandler;
    
}

- (void)loadRequest{
    
    if (self.parameters.count > 0) {
        
        [self serializeRequestParameters];
    }
    
    if(_requestOperationQueue == nil) {
        
        _requestOperationQueue = [[NSOperationQueue alloc] init];
        _requestOperationQueue.maxConcurrentOperationCount = 4;
        _requestOperationQueue.name = @"com.yayuhh.YYHRequest";
    }
    
    self.connection =[NSURLConnection connectionWithRequest:[self urlRequest] delegate:self];
    [self.connection setDelegateQueue:_requestOperationQueue];
    [self.connection start];
    
    
    
}

-(void)serializeRequestParameters{
    
    self.contentType = @"application/x-www-form-urlencoded";
    
    if ([self.method isEqualToString:@"GET"]) {
        self.url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[self.url absoluteString],@"?",[self HTTPBodyWithParameters:self.parameters]]];
        
        
         
    } else {
        
        self.body = [[self HTTPBodyWithParameters:self.parameters] dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        
        
    }

    
    
    
}



//网络请求相关，封装post参数
-(NSString *)HTTPBodyWithParameters:(NSDictionary *)parameters
{
    NSMutableArray *parametersArray = [[NSMutableArray alloc]init];
    
    for (NSString *key in [parameters allKeys]) {
        id value = [parameters objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            [parametersArray addObject:[NSString stringWithFormat:@"%@=%@",key,value]];
        }
        
    }
    
    NSLog(@"%@",[parametersArray componentsJoinedByString:@"&"]);
    
    return [parametersArray componentsJoinedByString:@"&"];
}

//网络请求相关，封装request获取



-(NSMutableURLRequest *)urlRequest{
    
    NSMutableURLRequest *requestMe=[[NSMutableURLRequest alloc] initWithURL:self.url];
    
    requestMe.HTTPMethod=self.method;
    requestMe.HTTPBody=self.body;
    
    for (NSString *key in [self.headers allKeys]){
        id value = [self.headers objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]]) {
            
            [requestMe setValue:value forKey:key];
        }
        
        if (self.body.length>0) {
            
            [requestMe setValue:[NSString stringWithFormat:@"%zi",self.body.length] forHTTPHeaderField:@"Content-Length"];
            
        }
        
        
        
    }
    
    return requestMe;
    
    
}




@end
