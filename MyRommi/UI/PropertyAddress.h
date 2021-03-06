//
//  PropertyAddress.h
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyAddress : UIViewController<UITextViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSMutableDictionary *propertyDictionary;
@property (strong, nonatomic) IBOutlet UITextField *houseNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *streetTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *PostalCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *CountryTextField;
@end