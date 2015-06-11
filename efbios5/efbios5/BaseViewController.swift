//
//  BaseViewController.swift
//  efbios5
//
//  Created by edao on 14/11/17.
//  Copyright (c) 2014年 edao. All rights reserved.
/*
self.createNavigationLeftButton("取消")
self.createNavigationRightButtonByPic("buttonbottomtag")
self.createNavigationRightButton("完成")
self.createNavigationLeftButtonByPic("icon10yszkmx")
*/
//

import UIKit



class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    -(void)initNav{
//    
//    if(IOS_VERSION>=7.0){
//    self.edgesForExtendedLayout =UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//    
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:IOS_VERSION>=7.0?@"top_background64.png":@"top_background.png"] forBarMetrics:UIBarMetricsDefault];
//    
//    
//    CGRect rectMain=[[UIScreen mainScreen] bounds];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rectMain.size.width-220,44)];
//    label.backgroundColor = [UIColor clearColor];
//    //label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//    label.textAlignment =NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.text=@"登录";
//    label.font=[UIFont boldSystemFontOfSize:23.0f];
//    self.navigationItem.titleView = label;
//    
//    
//    
//    }

    
    
    
    func initNav(title:String){
        
        
        let image=UIImage(named: "top_background64.png");
        
        
        self.navigationController?.navigationBar.setBackgroundImage(image, forBarMetrics: .Default);
        
        
        
        let rectMain=UIScreen.mainScreen().bounds;
        let label=UILabel(frame: CGRect(x:0,y:0,width:rectMain.size.width-220,height:64)) as UILabel;
        label.backgroundColor=UIColor.clearColor();
        label.textAlignment = .Center;
        label.textColor=UIColor.whiteColor();
        label.text=title;
        label.font=UIFont.boldSystemFontOfSize(23.0);
        self.navigationItem.titleView=label;
        
        
        
    }
    
    func createNavigationLeftButton(title:String){
       // [[[UIDevice currentDevice] systemVersion] floatValue]
        
        let mapButton=UIButton(frame:CGRect(x:0,y:0,width:47,height:44)) as UIButton;
        mapButton.titleLabel!.font = UIFont.boldSystemFontOfSize(21.0)
        mapButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mapButton.setTitle(title, forState: .Normal)
        mapButton.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        mapButton.titleEdgeInsets=UIEdgeInsetsMake(0.0, -10, 0.0, 0.0)
        mapButton.addTarget(self, action:"doLeftBtn", forControlEvents: .TouchUpInside)
        
        let btn_left = UIBarButtonItem(customView: mapButton)
        
        let mapButton1=UIButton(frame: CGRect(x:0.0, y:0.0, width:2, height:44)) as UIButton
        
        let buttonImage=UIImage(named: "top_leftBtn_bg.png")
        
        mapButton1.setImage(buttonImage, forState: .Normal)
        
        let btn_left1=UIBarButtonItem(customView: mapButton1)
        
        let version = UIDevice.currentDevice().systemVersion
        let versionNum:Float=(version as NSString).floatValue
        
       
        
        
        if versionNum >= 7.0{
            
            self.navigationItem.leftBarButtonItem=btn_left
            
        }else{
            
            let emptyArray1: Array = [btn_left1,btn_left]
            
            self.navigationItem.leftBarButtonItems = emptyArray1
                
           
            
        }
        
        
        
        
    }
    
    func doLeftBtn(){
       // [self.navigationController popViewControllerAnimated:YES];
        self.navigationController!.popToRootViewControllerAnimated(true)
        
        NSLog("%@","btnLeft Click")
        
    }
    
    
//    //创建导航栏左边接钮
//    -(void)createNavigationLeftButton
//    {
//    UIButton *mapButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    mapButton.frame=CGRectMake(0, 0, 47 , 44);
//    mapButton.titleLabel.font=[UIFont boldSystemFontOfSize:LEFTBTNTEXTSIZE];
//    [mapButton setTitle:@"取消" forState:UIControlStateNormal];
//    [mapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置标题颜色
//    [mapButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];//设置标题颜色
//    
//    
//    
//    [mapButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -10, 0.0, 0)];
//    
//    [mapButton addTarget:self action:@selector(doLeftBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:mapButton ];
//    
//    UIButton *mapButton1=[UIButton buttonWithType:UIButtonTypeCustom];
//    mapButton1.frame=CGRectMake(0, 0, 2 , 44);
//    
//    UIImage* buttonImage = [UIImage imageNamed:@"top_leftBtn_bg.png"];
//    [mapButton1 setImage:buttonImage forState:UIControlStateNormal];
//    
//    
//    
//    UIBarButtonItem *btn_left1 = [[UIBarButtonItem alloc] initWithCustomView:mapButton1];
//    
//    if(IOS_VERSION>=7.0){
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:mapButton];
//    
//    
//    }else{
//    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:btn_left1,btn_left,nil];
//    }
//    
//    
//    }
//    

//
//    //导航栏右边按钮的点击事件
//    -(void)doRightBtn{
//    
//    
//    
//    }
//    //创建导航栏右边接钮
//    -(void)createNavigationRightButton:(NSString*)btnImgPrefix
//    {
//    UIButton* mapButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 65 , 40)];
//    
//    UIImage*buttonImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",btnImgPrefix]];
//    [mapButton setImage:buttonImage forState:UIControlStateNormal];
//    UIImage*buttonImage2 = [UIImage imageNamed:[NSString stringWithFormat:@"%@_on.png",btnImgPrefix]];
//    [mapButton setImage:buttonImage2 forState:UIControlStateHighlighted];
//    
//    [mapButton addTarget:self action:@selector(doRightBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mapButton ];
//    }
//
    
    func createNavigationRightButtonByPic(title:String){
        
        let mapButton=UIButton(frame:CGRect(x:0,y:0,width:65,height:40)) as UIButton;
        
        var name:String=title+".png"
        let buttonImage=UIImage(named: name)
        mapButton.setImage(buttonImage, forState: .Normal)
        
        var name1:String=title+"_on.png"
        let buttonImage1=UIImage(named: name1)
        mapButton.setImage(buttonImage1, forState: .Highlighted)
        
        mapButton.addTarget(self, action:"doRightBtn1", forControlEvents: .TouchUpInside)
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mapButton)
        
        

        
        
    }
    
    func doRightBtn1(){
        NSLog("%@","btnRight Click by Pic")
        
    }
    
//    //创建导航栏右边接钮
//    -(void)createNavigationRightButton:(NSString*)btnImgPrefix
//    {
//    UIButton *mapButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    mapButton.frame=CGRectMake(0, 0, 47 , 44);
//    mapButton.titleLabel.font=[UIFont boldSystemFontOfSize:LEFTBTNTEXTSIZE];
//    [mapButton setTitle:btnImgPrefix forState:UIControlStateNormal];
//    [mapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置标题颜色
//    [mapButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];//设置标题颜色
//    
//    if(IOS_VERSION>=7.0){
//    [mapButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0, 0.0, -40)];
//    }else{
//    [mapButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0, 0.0, -18)];
//    }
//    
//    [mapButton addTarget:self action:@selector(doRightBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:mapButton ];
//    
//    UIButton *mapButton1=[UIButton buttonWithType:UIButtonTypeCustom];
//    mapButton1.frame=CGRectMake(0, 0, 2 , 44);
//    
//    UIImage* buttonImage = [UIImage imageNamed:@"top_leftBtn_bg.png"];
//    [mapButton1 setImage:buttonImage forState:UIControlStateNormal];
//    
//    
//    
//    UIBarButtonItem *btn_left1 = [[UIBarButtonItem alloc] initWithCustomView:mapButton1];
//    
//    
//    
//    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn_left1,btn_left,nil];
//    
//    }
//
    
    func createNavigationRightButton(title:String){
        
        let mapButton=UIButton(frame:CGRect(x:0,y:0,width:47,height:44)) as UIButton;
        mapButton.titleLabel!.font = UIFont.boldSystemFontOfSize(21.0)
        mapButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mapButton.setTitle(title, forState: .Normal)
        mapButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mapButton.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        
        let version = UIDevice.currentDevice().systemVersion
        let versionNum:Float=(version as NSString).floatValue

        
        if versionNum >= 7.0{
            
            mapButton.titleEdgeInsets=UIEdgeInsetsMake(0.0, 0.0, 0.0, -40)
            
        }else{
            
            mapButton.titleEdgeInsets=UIEdgeInsetsMake(0.0, 0.0, 0.0, -18)
            
            
        }

        
        
        
        
        mapButton.addTarget(self, action:"doRightBtn", forControlEvents: .TouchUpInside)
        
        let btn_left = UIBarButtonItem(customView: mapButton)
        
        
        
        
        let mapButton1=UIButton(frame: CGRect(x:0.0, y:0.0, width:2, height:44)) as UIButton
        
        let buttonImage=UIImage(named: "top_leftBtn_bg.png")
        
        mapButton1.setImage(buttonImage, forState: .Normal)
        
        let btn_left1=UIBarButtonItem(customView: mapButton1)
        
        let emptyArray1: Array = [btn_left1,btn_left]
        self.navigationItem.rightBarButtonItems = emptyArray1
        
        
        
        
    }

    func doRightBtn(){
        NSLog("%@","btnRight Click")
        
    }
    
    
//
//    -(void)doLeftBtn{
//    [self.navigationController popViewControllerAnimated:YES];
//    }
//    -(void)createNavigationLeftButton:(NSString*)btnImgPrefix
//    {
//    UIButton *mapButton=[UIButton buttonWithType:UIButtonTypeCustom];
//    mapButton.frame=CGRectMake(0, 0, 47 , 44);
//    UIImage*buttonImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",btnImgPrefix]];
//    [mapButton setImage:buttonImage forState:UIControlStateNormal];
//    UIImage*buttonImage2 = [UIImage imageNamed:[NSString stringWithFormat:@"%@_on.png",btnImgPrefix]];
//    
//    
//    
//    if(IOS_VERSION>=7.0){
//    
//    [mapButton setImageEdgeInsets:UIEdgeInsetsMake(0.0, -42, 0.0, 0)];
//    
//    }else{
//    
//    [mapButton setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0)];
//    
//    }
//    
//    
//    [mapButton setImage:buttonImage2 forState:UIControlStateHighlighted];
//    
//    
//    
//    [mapButton addTarget:self action:@selector(doLeftBtn) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:mapButton];
//    
//    
//    
//    }
    
    func createNavigationLeftButtonByPic(title:String){
        // [[[UIDevice currentDevice] systemVersion] floatValue]
        
        let mapButton=UIButton(frame:CGRect(x:0,y:0,width:47,height:44)) as UIButton;
        
        var name:String=title+".png"
        let buttonImage=UIImage(named: name)
        mapButton.setImage(buttonImage, forState: .Normal)
        
        var name1:String=title+"_on.png"
        let buttonImage1=UIImage(named: name1)
        mapButton.setImage(buttonImage1, forState: .Highlighted)
        
        let version = UIDevice.currentDevice().systemVersion
        let versionNum:Float=(version as NSString).floatValue
        
        
        if versionNum >= 7.0{
            
            mapButton.imageEdgeInsets=UIEdgeInsetsMake(0.0, -20, 0.0, 0)
            
        }else{
            
            mapButton.imageEdgeInsets=UIEdgeInsetsMake(0.0, -20, 0.0, 0)
            
            
        }

        
        
        
        
        mapButton.addTarget(self, action:"doLeftBtn1", forControlEvents: .TouchUpInside)
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mapButton)
        
        
        
        
        
    }
    
    func doLeftBtn1(){
        // [self.navigationController popViewControllerAnimated:YES];
        self.navigationController!.popToRootViewControllerAnimated(true)
        
        NSLog("%@","btnLeft Click by Pic")
        
    }

    


    
    


}
