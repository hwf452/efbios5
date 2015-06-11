//
//  EnterViewController.swift
//  efbios4
//
//  Created by edao on 14/11/17.
//  Copyright (c) 2014年 edao. All rights reserved.
//

import UIKit

class EnterViewController: BaseViewController {
    
    
    var connection:NSURLConnection?;
    
    
    var _dataRece:NSMutableData?;
    var _challenge:NSURLAuthenticationChallenge?;
    var requestType:Int?;
    var leftTag:Int?;
    var userDefault:NSUserDefaults?;
    var dictGetTarger:NSMutableDictionary?;
    //http响应码
    var httpResponse:NSHTTPURLResponse?;
    
    //进度条
    
    var _HUD:MBProgressHUD?;
    var request:NSMutableURLRequest?;
    var url:NSURL?;
    var baseUrl:NSURL?;
    
    
    
    
    

    @IBOutlet weak var phoneInput: UITextField!
    
    @IBOutlet weak var pwdInput1: UITextField!
    
    @IBOutlet weak var btnCheckBox1: UIButton!
    
    @IBOutlet weak var btnCheckBox2: UIButton!
    
    @IBAction func btnCheckBox2Click(sender: UIButton) {
        sender.selected = !sender.selected;
    }
    
    @IBAction func btnLogin2(sender: UIButton) {
        self.enterPriseName.resignFirstResponder();
        self.userName.resignFirstResponder();
        self.pwdInput2.resignFirstResponder();
        
        
    }
    
    @IBOutlet weak var enterPriseName: UITextField!
    
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var pwdInput2: UITextField!
    
    
    
    
    @IBAction func btnLogin1(sender: UIButton) {
        
        self.phoneInput.resignFirstResponder();
        self.pwdInput1.resignFirstResponder();
        
        let base1:Base1ViewController=Base1ViewController()
        
        self.navigationController!.pushViewController(base1, animated: true)
        
        
        
        
    }
    
    @IBOutlet weak var phoneLoginView: UIView!
    
    @IBOutlet weak var userLoginView: UIView!
    
    
    @IBOutlet weak var btnPhoneLogin: UIButton!
    
    @IBOutlet weak var btnUserLogin: UIButton!
    
    @IBAction func btnPhoneLoginClick(sender: UIButton) {
        self.btnPhoneLogin.selected=true;
        self.btnUserLogin.selected=false;
        self.phoneLoginView.hidden=false;
        self.userLoginView.hidden=true;
        self.enterPriseName.resignFirstResponder();
        self.userName.resignFirstResponder();
        self.pwdInput2.resignFirstResponder();
    }
    
    @IBAction func btnUserLoginClick(sender: UIButton) {
        self.btnPhoneLogin.selected=false;
        self.btnUserLogin.selected=true;
        self.phoneLoginView.hidden=true;
        self.userLoginView.hidden=false;
        self.phoneInput.resignFirstResponder();
        self.pwdInput1.resignFirstResponder();
        
    }
    
    @IBAction func btnVelidateLoginClick(sender: UIButton) {
    }
    
    @IBAction func btnCheckBox1Click(sender: UIButton) {
        
        sender.selected = !sender.selected;
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initNav("登录");
//        self.createNavigationLeftButton("取消")
//        self.createNavigationRightButtonByPic("buttonbottomtag")
//        self.createNavigationRightButton("完成")
//        self.createNavigationLeftButtonByPic("icon10yszkmx")
        
        self.btnPhoneLogin.selected=true;
        self.btnUserLogin.selected=false;
        self.phoneLoginView.hidden=false;
        self.userLoginView.hidden=true;
        self.btnCheckBox1.selected=true;
        self.btnCheckBox2.selected=true;
        
        
        
        
        
        
    }
    
//    //关闭键盘
//    - (BOOL)textFieldShouldReturn:(UITextField *)textField
//    {
//    [textField resignFirstResponder];
//    return YES;
//    }
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder();
        
        return true;
        
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
    
    
    

}
