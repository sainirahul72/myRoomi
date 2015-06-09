//
//  PropertyPreferences.m
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyPreferences.h"
#import "PropertyDescription.h"

int student=0, working=0, Entrepreneur=0;
@interface PropertyPreferences ()
@property (nonatomic, strong) NSMutableDictionary *propertyPref;
@property bool isStudent;
@property bool isProfessionl;
@property bool isEntrepreneur;
@end

@implementation PropertyPreferences

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.tableView reloadData];
    self.propertyPref = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"pref_gender",@"",@"pref_occupation",@"",@"pref_food",@"",@"pref_smok_drink",@"",@"pref_guests",@"",@"pref_pets", nil];
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
            [self.male setSelected:YES];
            [self.anyGender setSelected:NO];
            [self.female setSelected:NO];
            [self.propertyPref setValue:@"0" forKey:@"pref_gender"];
            break;
        case 2:
            [self.male setSelected:NO];
            [self.anyGender setSelected:NO];
            [self.female setSelected:YES];
            [self.propertyPref setValue:@"1" forKey:@"pref_gender"];
            break;
        case 3:
            [self.male setSelected:NO];
            [self.anyGender setSelected:YES];
            [self.female setSelected:NO];
            [self.propertyPref setValue:@"2" forKey:@"pref_gender"];
            break;
        
        
        case 4:
            if ((student%2)==0) {
                [self.student setSelected:YES];
                self.isStudent = YES;
            }
            else{
                [self.student setSelected:NO];
                self.isStudent = NO;
            }
            student++;
            [self.anyProfession setSelected:NO];
            break;
        case 5:
            if ((working%2)==0) {
                [self.working setSelected:YES];
                self.isProfessionl = YES;
            }
            else{
                [self.working setSelected:NO];
                self.isProfessionl = NO;
            }
            working++;
            [self.anyProfession setSelected:NO];
            break;
        case 6:
            if ((Entrepreneur%2)==0) {
                [self.entrepreneur setSelected:YES];
                self.isEntrepreneur = YES;
            }
            else{
                [self.entrepreneur setSelected:NO];
                self.isEntrepreneur = NO;
            }
            Entrepreneur++;
            [self.anyProfession setSelected:NO];
            break;
        case 7:
            [self.anyProfession setSelected:YES];
            Entrepreneur=0;
            working=0;
            student=0;
            [self.student setSelected:NO];
            [self.working setSelected:NO];
            [self.entrepreneur setSelected:NO];
            self.isStudent = NO;
            self.isProfessionl = NO;
            self.isEntrepreneur = NO;
            break;
        
        
        case 8:
            [self.veg setSelected:YES];
            [self.nonVeg setSelected:NO];
            [self.anyFood setSelected:NO];
            [self.propertyPref setValue:@"0" forKey:@"pref_food"];
            break;
        case 9:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:YES];
            [self.anyFood setSelected:NO];
            [self.propertyPref setValue:@"1" forKey:@"pref_food"];
            break;
        case 10:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:NO];
            [self.anyFood setSelected:YES];
            [self.propertyPref setValue:@"2" forKey:@"pref_food"];
            break;
        
        
        case 11:
            [self.SmokingAllowed setSelected:YES];
            [self.SmokingNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"1" forKey:@"pref_smok_drink"];
            break;
        case 12:
            [self.SmokingAllowed setSelected:NO];
            [self.SmokingNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"0" forKey:@"pref_smok_drink"];
            
            break;
        
        
        case 13:
            [self.GuestAllowed setSelected:YES];
            [self.GuestNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"1" forKey:@"pref_guests"];
            break;
        case 14:
            [self.GuestAllowed setSelected:NO];
            [self.GuestNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"0" forKey:@"pref_guests"];
            break;
        
        
        case 15:
            [self.PetsAllowed setSelected:YES];
            [self.PetsNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"1" forKey:@"pref_pets"];
            break;
        case 16:
            [self.PetsAllowed setSelected:NO];
            [self.PetsNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"0" forKey:@"pref_pets"];
            break;
        
        
        default:
            break;
    }
}
- (IBAction)continueBurron:(id)sender {
    if ((!self.isEntrepreneur)&&(!self.isStudent)&&(!self.isProfessionl)) {
        [self.propertyPref setValue:@"3" forKey:@"pref_occupation"];
    }
    else{
        if (self.isStudent) {
            if (self.isProfessionl) {
                if (self.isEntrepreneur) {
                    [self.propertyPref setValue:@"0,1,2" forKey:@"pref_occupation"];
                }
                else{
                    [self.propertyPref setValue:@"0,1" forKey:@"pref_occupation"];
                }
            }
            else{
                if (self.isEntrepreneur) {
                    [self.propertyPref setValue:@"0,2" forKey:@"pref_occupation"];
                }
                else{
                    [self.propertyPref setValue:@"0" forKey:@"pref_occupation"];
                }
            }
        }
        else{
            if (self.isProfessionl) {
                if (self.isEntrepreneur) {
                    [self.propertyPref setValue:@"1,2" forKey:@"pref_occupation"];
                }
                else{
                    [self.propertyPref setValue:@"1" forKey:@"pref_occupation"];
                }
            }
            else{
                if (self.isEntrepreneur) {
                    [self.propertyPref setValue:@"2" forKey:@"pref_occupation"];
                }
            }

        }
    }
    [self.propertyDictionary setObject:self.propertyPref forKey:@"property_prefrences"];
    [self performSegueWithIdentifier:@"PropertyDescription" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PropertyDescription"]) {
        PropertyDescription *propertyDesVC = [segue destinationViewController];
        propertyDesVC.propertyDictionary = self.propertyDictionary;
    }
}


@end
