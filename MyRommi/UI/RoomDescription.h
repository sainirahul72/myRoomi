//
//  RoomDescription.h
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomDescription : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *roomsAvailableCount;
@property (strong, nonatomic) IBOutlet UILabel *bedPerRoomCount;
@property (strong, nonatomic) IBOutlet UIButton *roomCountDec;
@property (strong, nonatomic) IBOutlet UIButton *roomCountInc;
@property (strong, nonatomic) IBOutlet UIButton *bedsCountDec;
@property (strong, nonatomic) IBOutlet UIButton *bedsCountInc;
@property (strong, nonatomic) IBOutlet UIButton *roomSharedYes;
@property (strong, nonatomic) IBOutlet UIButton *roomSharedNo;
@property (strong, nonatomic) IBOutlet UIButton *attachedBathroomYes;
@property (strong, nonatomic) IBOutlet UIButton *attachedBathroomNo;
@property (strong, nonatomic) IBOutlet UIButton *bedsYes;
@property (strong, nonatomic) IBOutlet UIButton *bedsNo;
@property (strong, nonatomic) IBOutlet UIButton *balconyYes;
@property (strong, nonatomic) IBOutlet UIButton *balconyNo;
@property (nonatomic, strong) NSMutableDictionary *propertyDictionary;
@end
