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
    self.roomDes = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"avlbl_rooms",@"",@"number_of_beds_per_room",@"",@"avlbl_room_is_shared",@"",@"avlbl_attached_bathroom",@"",@"avlbl_beds",@"",@"avlbl_balcony", nil];
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
            [self.roomDes setValue:@"1" forKey:@"avlbl_room_is_shared"];
            break;
        case 2:
            [self.roomSharedYes setSelected:NO];
            [self.roomSharedNo setSelected:YES];
            [self.roomDes setValue:@"0" forKey:@"avlbl_room_is_shared"];
            break;
            
            
        case 3:
            [self.attachedBathroomYes setSelected:YES];
            [self.attachedBathroomNo setSelected:NO];
            [self.roomDes setValue:@"1" forKey:@"avlbl_attached_bathroom"];
            break;
        case 4:
            [self.attachedBathroomYes setSelected:NO];
            [self.attachedBathroomNo setSelected:YES];
            [self.roomDes setValue:@"0" forKey:@"avlbl_attached_bathroom"];
            break;
            
            
        case 5:
            [self.bedsYes setSelected:YES];
            [self.bedsNo setSelected:NO];
            [self.roomDes setValue:@"1" forKey:@"avlbl_beds"];
            break;
        case 6:
            [self.bedsYes setSelected:NO];
            [self.bedsNo setSelected:YES];
            [self.roomDes setValue:@"0" forKey:@"avlbl_beds"];
            break;
            
            
        case 7:
            [self.balconyYes setSelected:YES];
            [self.balconyNo setSelected:NO];
            [self.roomDes setValue:@"1" forKey:@"avlbl_balcony"];
            break;
        case 8:
            [self.balconyYes setSelected:NO];
            [self.balconyNo setSelected:YES];
            [self.roomDes setValue:@"0" forKey:@"avlbl_balcony"];
            break;
            
        case 9:
            if (self.roomsAvailableCount.text.intValue > 1) {
                [self.roomsAvailableCount setText:[NSString stringWithFormat:@"%d",(self.roomsAvailableCount.text.intValue-1)]];
                [self.roomDes setValue:self.roomsAvailableCount.text forKey:@"avlbl_rooms"];
            }
            
            break;
        case 10:
            if (self.roomsAvailableCount.text.intValue < 4) {
                [self.roomsAvailableCount setText:[NSString stringWithFormat:@"%d",(self.roomsAvailableCount.text.intValue+1)]];
                [self.roomDes setValue:self.roomsAvailableCount.text forKey:@"avlbl_rooms"];
            }
            break;
            
            
        case 11:
            if (self.bedPerRoomCount.text.intValue > 1) {
                [self.bedPerRoomCount setText:[NSString stringWithFormat:@"%d",(self.bedPerRoomCount.text.intValue-1)]];
                [self.roomDes setValue:self.bedPerRoomCount.text forKey:@"number_of_beds_per_room"];
            }
            break;
            case 12:
            if (self.bedPerRoomCount.text.intValue < 3) {
                [self.bedPerRoomCount setText:[NSString stringWithFormat:@"%d",(self.bedPerRoomCount.text.intValue+1)]];
                [self.roomDes setValue:self.bedPerRoomCount.text forKey:@"number_of_beds_per_room"];
            }
            break;
        default:
            break;
    }
}

- (IBAction)continueBurron:(id)sender {
    [self.propertyDictionary setObject:self.roomDes forKey:@"room_description"];
    //[self performSegueWithIdentifier:@"propertyLocation" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //if ([segue.identifier isEqualToString:@"propertyLocation"]) {
//        PropertyLocation *propertyLocationVC = [segue destinationViewController];
        //propertyLocationVC.propertyDictionary = self.propertyDictionary;
}

@end
