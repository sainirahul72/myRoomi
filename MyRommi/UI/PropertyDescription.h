//
//  PropertyDescription.h
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyDescription : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *balcony;
@property (strong, nonatomic) IBOutlet UILabel *peopleLivingIn;
@property (strong, nonatomic) IBOutlet UILabel *bathrooms;
@property (strong, nonatomic) IBOutlet UILabel *rooms;
@property (strong, nonatomic) IBOutlet UIButton *roomCountDec;
@property (strong, nonatomic) IBOutlet UIButton *roomCountInc;
@property (strong, nonatomic) IBOutlet UIButton *bathroomDec;
@property (strong, nonatomic) IBOutlet UIButton *bathroomInc;
@property (strong, nonatomic) IBOutlet UIButton *peopleCountDec;
@property (strong, nonatomic) IBOutlet UIButton *peopleCountInc;
@property (strong, nonatomic) IBOutlet UIButton *balconyDec;
@property (strong, nonatomic) IBOutlet UIButton *balconyInc;
@property (nonatomic, strong) NSMutableDictionary *propertyDictionary;
@end
