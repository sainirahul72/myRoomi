//
//  PropertyDescription.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
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
    self.propertyDes= [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"rooms",@"",@"bathrooms",@"",@"peopleCount",@"",@"balcony", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(id)sender {
    switch ([sender tag]) {

        case 1:
            //[self.rooms setText:[NSString stringWithFormat:@"%d",]];
            [self.propertyDes setValue:self.rooms.text forKey:@"rooms"];
            break;
        case 2:
            [self.propertyDes setValue:self.rooms.text forKey:@"rooms"];
            break;
        case 3:
            [self.propertyDes setValue:self.bathrooms.text forKey:@"bathrooms"];
            break;
        case 4:
            [self.propertyDes setValue:self.bathrooms.text forKey:@"bathrooms"];
            break;
        case 5:
            [self.propertyDes setValue:self.peopleLivingIn.text forKey:@"peopleCount"];
            break;
        case 6:
            [self.propertyDes setValue:self.peopleLivingIn.text forKey:@"peopleCount"];
            break;
        case 7:
            [self.propertyDes setValue:self.balcony.text forKey:@"balcony"];
            break;
        case 8:
            [self.propertyDes setValue:self.balcony.text forKey:@"balcony"];
            break;
            
        default:
            break;
    }
}

- (IBAction)continueBurron:(id)sender {
    [self.propertyDictionary setObject:self.propertyDes forKey:@"propertyDes"];
    [self performSegueWithIdentifier:@"roomDescription" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"roomDescription"]) {
        RoomDescription *roomDesVC = [segue destinationViewController];
        roomDesVC.propertyDictionary = self.propertyDictionary;
    }
}

@end
