//
//  PropertyPreferences.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyPreferences.h"
#import "PropertyDescription.h"

int student=0, working=0, Entrepreneur=0;
@interface PropertyPreferences ()
@property (nonatomic, strong) NSMutableDictionary *propertyPref;
@end

@implementation PropertyPreferences

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.tableView reloadData];
    self.propertyPref = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"gender",@"",@"occupation",@"",@"food",@"",@"smoking",@"",@"guests",@"",@"pets", nil];
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
            [self.propertyPref setValue:@"male" forKey:@"gender"];
            break;
        case 2:
            [self.male setSelected:NO];
            [self.anyGender setSelected:NO];
            [self.female setSelected:YES];
            [self.propertyPref setValue:@"female" forKey:@"gender"];
            break;
        case 3:
            [self.male setSelected:NO];
            [self.anyGender setSelected:YES];
            [self.female setSelected:NO];
            [self.propertyPref setValue:@"any" forKey:@"gender"];
            break;
        
        
        case 4:
            if ((student%2)==0) {
                [self.student setSelected:YES];
            }
            else{
                [self.student setSelected:NO];
            }
            student++;
            [self.anyProfession setSelected:NO];
            break;
        case 5:
            if ((working%2)==0) {
                [self.working setSelected:YES];
            }
            else{
                [self.working setSelected:NO];
            }
            working++;
            [self.anyProfession setSelected:NO];
            break;
        case 6:
            if ((Entrepreneur%2)==0) {
                [self.entrepreneur setSelected:YES];
            }
            else{
                [self.entrepreneur setSelected:NO];
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
            break;
        
        
        case 8:
            [self.veg setSelected:YES];
            [self.nonVeg setSelected:NO];
            [self.anyFood setSelected:NO];
            [self.propertyPref setValue:@"veg" forKey:@"food"];
            break;
        case 9:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:YES];
            [self.anyFood setSelected:NO];
            [self.propertyPref setValue:@"non-veg" forKey:@"food"];
            break;
        case 10:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:NO];
            [self.anyFood setSelected:YES];
            [self.propertyPref setValue:@"any" forKey:@"food"];
            break;
        
        
        case 11:
            [self.SmokingAllowed setSelected:YES];
            [self.SmokingNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"yes" forKey:@"smoking"];
            break;
        case 12:
            [self.SmokingAllowed setSelected:NO];
            [self.SmokingNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"no" forKey:@"smoking"];
            
            break;
        
        
        case 13:
            [self.GuestAllowed setSelected:YES];
            [self.GuestNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"yes" forKey:@"guests"];
            break;
        case 14:
            [self.GuestAllowed setSelected:NO];
            [self.GuestNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"no" forKey:@"guests"];
            break;
        
        
        case 15:
            [self.PetsAllowed setSelected:YES];
            [self.PetsNotAllowed setSelected:NO];
            [self.propertyPref setValue:@"yes" forKey:@"pets"];
            break;
        case 16:
            [self.PetsAllowed setSelected:NO];
            [self.PetsNotAllowed setSelected:YES];
            [self.propertyPref setValue:@"no" forKey:@"pets"];
            break;
        
        
        default:
            break;
    }
}
- (IBAction)continueBurron:(id)sender {
    [self.propertyDictionary setObject:self.propertyPref forKey:@"propertyPref"];
    [self performSegueWithIdentifier:@"PropertyDescription" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PropertyDescription"]) {
        PropertyDescription *propertyDesVC = [segue destinationViewController];
        propertyDesVC.propertyDictionary = self.propertyDictionary;
    }
}


@end
