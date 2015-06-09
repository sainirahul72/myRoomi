//
//  HomeViewController.h
//  MyRommi
//
//  Created by Rahul Saini on 08/06/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface HomeViewController : UIViewController<FBSDKLoginButtonDelegate>
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end
