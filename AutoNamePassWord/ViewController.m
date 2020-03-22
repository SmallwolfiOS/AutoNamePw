//
//  ViewController.m
//  AutoNamePassWord
//
//  Created by Apple on 2020/3/22.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}
- (IBAction)signup:(id)sender {
    if (_nameField.text.length == 0 ||_passwordField.text.length == 0) {
        NSLog(@"用户名或密码不可用");
        return;
    }
    SecAddSharedWebCredential( (__bridge CFStringRef)@"smallwolfios.github.io", (__bridge CFStringRef)@"dsfsdkf",  (__bridge CFStringRef)_passwordField.text, ^(CFErrorRef  _Nullable error) {
        if (!error) {
            NSLog(@"密码保存成功");
        }else{
            NSLog(@"密码保存失败");
        }
    });
}
- (IBAction)signin:(id)sender {
    if (_nameField.text.length == 0 ||_passwordField.text.length == 0) {
        NSLog(@"用户名或密码不可用");
    }else{
        NSLog(@"用户名 :%@ 密码 :%@",_nameField.text,_passwordField.text);
    }
}




//if (@available(iOS 12.0, *)) {
//    self.passwordField.textContentType = UITextContentTypeNewPassword;
//    self.passwordField.passwordRules = [UITextInputPasswordRules passwordRulesWithDescriptor:@"required: lower; required: upper; allowe: digit; required: [-]; minlength: 5;"];
//} else {
//    self.passwordField.textContentType = UITextContentTypePassword;
//}

@end
