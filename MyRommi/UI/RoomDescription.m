//
//  RoomDescription.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "RoomDescription.h"
#import "PropertyLocation.h"

@interface RoomDescription ()
@property (nonatomic, strong) NSMutableDictionary *roomDes;
@end

@implementation RoomDescription

- (void)viewDidLoad {
    [super viewDidLoad];
    self.roomDes = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"roomAvailableCount",@"",@"bedsPerRoomCount",@"",@"roomShared",@"",@"attachedBathroom",@"",@"furnishedWithBed",@"",@"balconyAttached", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Button_Selection:(id)sender
{
    switch ([sender tag]) {
        
        case 1:
            [self.roomSharedYes setSelected:YES];
            [self.roomSharedNo setSelected:NO];
            [self.roomDes setValue:@"yes" forKey:@"roomShared"];
            break;
        case 2:
            [self.roomSharedYes setSelected:NO];
            [self.roomSharedNo setSelected:YES];
            [self.roomDes setValue:@"no" forKey:@"roomShared"];
            break;
            
            
        case 3:
            [self.attachedBathroomYes setSelected:YES];
            [self.attachedBathroomNo setSelected:NO];
            [self.roomDes setValue:@"yes" forKey:@"attachedBathroom"];
            break;
        case 4:
            [self.attachedBathroomYes setSelected:NO];
            [self.attachedBathroomNo setSelected:YES];
            [self.roomDes setValue:@"no" forKey:@"attachedBathroom"];
            break;
            
            
        case 5:
            [self.bedsYes setSelected:YES];
            [self.bedsNo setSelected:NO];
            [self.roomDes setValue:@"yes" forKey:@"furnishedWithBed"];
            break;
        case 6:
            [self.bedsYes setSelected:NO];
            [self.bedsNo setSelected:YES];
            [self.roomDes setValue:@"no" forKey:@"furnishedWithBed"];
            break;
            
            
        case 7:
            [self.balconyYes setSelected:YES];
            [self.balconyNo setSelected:NO];
            [self.roomDes setValue:@"yes" forKey:@"balconyAttached"];
            break;
        case 8:
            [self.balconyYes setSelected:NO];
            [self.balconyNo setSelected:YES];
            [self.roomDes setValue:@"no" forKey:@"balconyAttached"];
            break;
            
            
        default:
            break;
    }
}

- (IBAction)continueBurron:(id)sender {
    [self.propertyDictionary setObject:self.roomDes forKey:@"roomDes"];
    [self performSegueWithIdentifier:@"propertyLocation" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyLocation"]) {
        PropertyLocation *propertyLocationVC = [segue destinationViewController];
        propertyLocationVC.propertyDictionary = self.propertyDictionary;
    }
}

@end
