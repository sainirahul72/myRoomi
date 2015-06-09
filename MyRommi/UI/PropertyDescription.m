//
//  PropertyDescription.m
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyDescription.h"
#import "RoomDescription.h"

@interface PropertyDescription ()
@property (nonatomic, strong) NSMutableDictionary *propertyDes;
@end

@implementation PropertyDescription

- (void)viewDidLoad {
    [super viewDidLoad];
    self.propertyDes= [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"prop_bedrooms",@"",@"prop_bathrooms",@"",@"people_count",@"",@"prop_balcony", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(id)sender {
    switch ([sender tag]) {

        case 1:
            if (self.rooms.text.intValue > 1) {
                [self.rooms setText:[NSString stringWithFormat:@"%d",(self.rooms.text.intValue-1)]];
                if (self.bathrooms.text.intValue > self.rooms.text.intValue) {
                    [self.bathrooms setText:[NSString stringWithFormat:@"%d",(self.rooms.text.intValue)]];
                }
                if (self.peopleLivingIn.text.intValue > 2*self.rooms.text.intValue) {
                    [self.peopleLivingIn setText:[NSString stringWithFormat:@"%d",(2*self.rooms.text.intValue)]];
                }
                if (self.balcony.text.intValue > self.rooms.text.intValue) {
                    [self.balcony setText:[NSString stringWithFormat:@"%d",(self.rooms.text.intValue)]];
                }
            }
            break;
        case 2:
            if (self.rooms.text.intValue < 4) {
                [self.rooms setText:[NSString stringWithFormat:@"%d",(self.rooms.text.intValue+1)]];
            }
            break;
        case 3:
            if (self.bathrooms.text.intValue > 1) {
                [self.bathrooms setText:[NSString stringWithFormat:@"%d",(self.bathrooms.text.intValue-1)]];
            }
            break;
        case 4:
            if (self.bathrooms.text.intValue < self.rooms.text.intValue) {
                [self.bathrooms setText:[NSString stringWithFormat:@"%d",(self.bathrooms.text.intValue+1)]];
            }
            break;
        case 5:
            if (self.peopleLivingIn.text.intValue > 0) {
                [self.peopleLivingIn setText:[NSString stringWithFormat:@"%d",(self.peopleLivingIn.text.intValue-1)]];
            }
            break;
        case 6:
            if (self.peopleLivingIn.text.intValue < 2*self.rooms.text.intValue) {
                [self.peopleLivingIn setText:[NSString stringWithFormat:@"%d",(self.peopleLivingIn.text.intValue+1)]];
            }
            break;
        case 7:
            if (self.balcony.text.intValue > 0) {
                [self.balcony setText:[NSString stringWithFormat:@"%d",(self.balcony.text.intValue-1)]];
            }
            break;
        case 8:
            if (self.balcony.text.intValue < self.rooms.text.intValue) {
                [self.balcony setText:[NSString stringWithFormat:@"%d",(self.balcony.text.intValue+1)]];
            }
            break;
            
        default:
            break;
    }
}

- (IBAction)continueBurron:(id)sender {
    [self.propertyDes setValue:self.rooms.text forKey:@"prop_bedrooms"];
    [self.propertyDes setValue:self.bathrooms.text forKey:@"prop_bathrooms"];
    [self.propertyDes setValue:self.peopleLivingIn.text forKey:@"people_count"];
    [self.propertyDes setValue:self.balcony.text forKey:@"prop_balcony"];
    [self.propertyDictionary setObject:self.propertyDes forKey:@"property_description"];
    [self performSegueWithIdentifier:@"roomDescription" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"roomDescription"]) {
        RoomDescription *roomDesVC = [segue destinationViewController];
        roomDesVC.propertyDictionary = self.propertyDictionary;
    }
}

@end
