//
//  HomeViewController.m
//  MyRommi
//
//  Created by Rahul Saini on 08/06/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"%@",[FBSDKAccessToken currentAccessToken]);
    }
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"%@",result);
    
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
