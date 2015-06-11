//
//  AppDelegate.swift
//  efbios5
//
//  Created by edao on 14/11/17.
//  Copyright (c) 2014年 edao. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,NSURLConnectionDelegate{

    var window: UIWindow?
    var connection:NSURLConnection?;
    
    
    var _dataRece:NSMutableData?;
    var _challenge:NSURLAuthenticationChallenge?;
    var requestType:Int?;
    var leftTag:Int?;
    var userDefault:NSUserDefaults?;
    var dictGetTarger:NSMutableDictionary?;
    //http响应码
    //var httpResponse:NSHTTPURLResponse?;
    
    //进度条
    
    var _HUD:MBProgressHUD?;
    var request:NSMutableURLRequest?;
    var _url:NSURL?;
    var _baseUrl:NSURL?;
    
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        sleep(3);
        
        self.window=UIWindow(frame: UIScreen.mainScreen().bounds);
        
        self.window!.backgroundColor=UIColor.whiteColor();
        
        userDefault=NSUserDefaults.standardUserDefaults();
        NSThread.sleepForTimeInterval(2)
//        _HUD=[[MBProgressHUD alloc] initWithView:self.view];
//        _HUD.dimBackground = NO;
//        
//        _HUD.labelText=@"数据处理中";
        
        _HUD=MBProgressHUD()
        _HUD?.dimBackground=false;
        _HUD?.labelText = "数据处理中"
        
        
        //getServerUrl()
        
        
//        let request = YYHRequest(url: NSURL(string: "http://112.124.25.208/sheyuntong/api/login.api.php")!)
//        request.method = "POST"
//        request.parameters["username"] = "test"
//        request.parameters["password"] = "123456"
//        
//        
//        
//        request.completionHandler = { response, data, error in
//            // request complete!
//            
//            println(response)
//            println()
//            println(data?.objectFromJSONData())
//            
//            
//            
//            
//            
//        }
//        
//        request.loadRequest()
        
        
        
        let request = YYHRequest(url: NSURL(string: "https://api.jyb360.com:8444/efb/getServiceURL")!)
        request.method = "POST"
        request.parameters["clientSideType"] = "2"
        request.parameters["clientSideVersion"] = "1.2"
        
        
        
        request.completionHandler = { response, data, error in
            // request complete!
            
           // println(response)
            println()
            println(data?.objectFromJSONData())
            
            var httpResponse:NSHTTPURLResponse = response as NSHTTPURLResponse
            
            println(httpResponse.statusCode)
            
            var arrayJson = data?.objectFromJSONData()
            
            
            
            
            let dict = arrayJson?.objectAtIndex(0)
            
            let dict1=dict!.objectForKey("serviceURL")
            
            let str:String = dict1 as String
            
                println(str)
            
            println(countElements(str))
            
            var characs = Array<Character>()
            
            
            
            for charac in str {
                
                characs.append(charac)
                
            }
            
            println("array:::\(characs)")
            
            
        }
        
        request.loadRequest()

        
        

        
        
        
        //设置app通知栏为半透明
        //[application setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
        application.setStatusBarStyle(.BlackOpaque, animated: false)
        
        let enter:EnterViewController=EnterViewController(nibName:"EnterViewController", bundle: nil);
        let nav:UINavigationController=UINavigationController(rootViewController: enter);
        
        self.window!.rootViewController=nav;
        
        self.window!.makeKeyAndVisible();
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func getServerUrl(){
        
        _url=NSURL(string:"https://api.jyb360.com:8444/efb/getServiceURL")
            
        println(_url?)
        
        _dataRece=NSMutableData()
        
        requestType=1;
        
        _dataRece?.resetBytesInRange(NSMakeRange(0,0))
        
        _dataRece?.length=0
        
        var dict:NSMutableDictionary=NSMutableDictionary()
        
        dict.setObject("2", forKey: "clientSideType")
        dict.setObject("1.2", forKey:"clientSideVersion")
        
        
        
        
        
        var postRequest:NSURLRequest = HTTPPOSTNormalRequestForURL(_url!, parameters: dict)
        
       // NSURLRequest *postRequest =[self HTTPPOSTNormalRequestForURL:_url parameters:dict];
        
        NSURLConnection(request: postRequest, delegate: self)
        
        
        
      
        
    }
    
    func HTTPPOSTNormalRequestForURL(url:NSURL,parameters:NSDictionary) -> NSURLRequest{
        
        var URLRequest = NSMutableURLRequest(URL:url, cachePolicy:.UseProtocolCachePolicy, timeoutInterval: 8)
        
        var HTTPBodyString:String = HTTPBodyWithParameters(parameters)
        
        URLRequest.HTTPBody = HTTPBodyString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        URLRequest.HTTPMethod = "POST"
        
        return URLRequest;
    }
    
    //网络请求参数处理
    
    func HTTPBodyWithParameters(parameters:NSDictionary) -> String{
        
        var parametersArray:NSMutableArray = NSMutableArray()
        
//        for key in parameters.allKeys {
//            
//            var value:String = parameters.objectForKey(key) as String
//            var param = key as String + "=" + value
//            
//            parametersArray.addObject( param )
//            
//        }
        
        for (key, value) in parameters {
            
            let encodedKey: NSString = key.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            let encodedValue: NSString = value.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            
            var param = "\(encodedKey)=\(encodedValue)"
            
            parametersArray.addObject( param )
            
        }
        
        
        
        println(parametersArray.componentsJoinedByString("&"))
        
        
        return parametersArray.componentsJoinedByString("&")
    }
    
    //pragma mark - URLConnection delegate https验证服务端证书
    
    func connection(connection: NSURLConnection, canAuthenticateAgainstProtectionSpace protectionSpace: NSURLProtectionSpace) -> Bool{
        
        
        
        
        return protectionSpace.authenticationMethod==NSURLAuthenticationMethodServerTrust
        
        
        
    }
    
    //解析服务端证书
    
    func connection(connection: NSURLConnection, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge){
        
        _challenge=challenge;
        
        var credential:NSURLCredential?;
        var protectionSpace:NSURLProtectionSpace?;
        var trust:SecTrustRef?;
        var host:NSString?;
        
        
        protectionSpace=_challenge?.protectionSpace
        
        trust=protectionSpace?.serverTrust;
        
        credential=NSURLCredential(forTrust: trust)
        
        host=_challenge?.protectionSpace.host;
        
        
        
        
        if (SecTrustGetCertificateCount(trust) > 0) {
           
          var serverCert = SecTrustGetCertificateAtIndex(trust, 0)

            
        }
        
        _challenge!.sender.useCredential(credential!, forAuthenticationChallenge: _challenge!)
        
        
        
    }
    
    //服务端有响应就调用这个方法，主要是获取响应码
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse){
        
        
        
       // httpResponse! = response as NSHTTPURLResponse
        
        println(response)
        
        
        
        
        
    }
    
    //当接收到数据
    func connection(connection: NSURLConnection, didReceiveData data: NSData){
        
        NSLog("%i",requestType!);
        NSLog("dataLeng:%zi",data.length);
        
        _dataRece!.appendData(data)
        
        
    }
    
    //网络连接失败时调用
    func connection(connection: NSURLConnection, didFailWithError error: NSError){
        
        NSLog("connect error :%@", error);
        _HUD!.labelText="网络连接失败";
        
        
        _HUD?.removeFromSuperview()
        
        
        
        
    }
    
   
    
    func connectionDidFinishLoading(connection: NSURLConnection){
        
        if (requestType==1) {
            
            //NSDictionary *dict=[arry objectAtIndex:0];
            
            
            //NSArray *arrydd = [_dataRece objectFromJSONData];
            
            

            let str = _dataRece?.objectFromJSONData()
            
            println(str)
            
             //   [[NSString alloc] initWithData:_dataRece encoding:NSUTF8StringEncoding];
            
            
            
            
            
            //NSLog(@"%i",requestType);
            NSLog("服务器连接成功");
            
            
            
            
            
            
            //获取服务端请求ip
        }
        
        
    }
    
        
        
   
    
    
 


    
  
}

