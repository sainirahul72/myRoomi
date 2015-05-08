//
//  PropertyPreferences.h
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyPreferences : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *male;
@property (strong, nonatomic) IBOutlet UIButton *female;
@property (strong, nonatomic) IBOutlet UIButton *anyGender;
@property (strong, nonatomic) IBOutlet UIButton *student;
@property (strong, nonatomic) IBOutlet UIButton *working;
@property (strong, nonatomic) IBOutlet UIButton *entrepreneur;
@property (strong, nonatomic) IBOutlet UIButton *anyProfession;
@property (strong, nonatomic) IBOutlet UIButton *veg;
@property (strong, nonatomic) IBOutlet UIButton *nonVeg;
@property (strong, nonatomic) IBOutlet UIButton *anyFood;
@property (strong, nonatomic) IBOutlet UIButton *SmokingAllowed;
@property (strong, nonatomic) IBOutlet UIButton *SmokingNotAllowed;
@property (strong, nonatomic) IBOutlet UIButton *PetsAllowed;
@property (strong, nonatomic) IBOutlet UIButton *PetsNotAllowed;
@property (strong, nonatomic) IBOutlet UIButton *GuestAllowed;
@property (strong, nonatomic) IBOutlet UIButton *GuestNotAllowed;
@property (nonatomic, strong) NSMutableDictionary *propertyDictionary;


@end
