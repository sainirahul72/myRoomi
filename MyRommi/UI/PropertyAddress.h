//
//  PropertyAddress.h
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyAddress : UIViewController<UITextViewDelegate>
@property (nonatomic, strong) NSString *propertyType;
@property (strong, nonatomic) IBOutlet UITextField *houseNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *streetTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *PostalCodeTextField;
@property (strong, nonatomic) IBOutlet UITextField *CountryTextField;
@end