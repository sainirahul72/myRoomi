//
//  PropertyPreferences.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyPreferences.h"
#import "MIRadioButtonGroup.h"

@interface PropertyPreferences ()

@end

@implementation PropertyPreferences

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *gender =[[NSArray alloc]initWithObjects:@" Male",@" Female",@" Any",nil];
    NSArray *food =[[NSArray alloc]initWithObjects:@" Veg",@" No-Veg",@" Any",nil];
    NSArray *smokingDrinking =[[NSArray alloc]initWithObjects:@" Allowed",@" Not Allowed",nil];
    NSArray *guests =[[NSArray alloc]initWithObjects:@" Allowed",@" Not Allowed",nil];
    NSArray *pets =[[NSArray alloc]initWithObjects:@" Allowed",@" Not Allowed",nil];
    MIRadioButtonGroup *genderButton =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 90, 320, 70) andOptions:gender andColumns:2];
    MIRadioButtonGroup *foodButton =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 260, 320, 70) andOptions:food andColumns:2];
    MIRadioButtonGroup *smokingDrinkingButton =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 339, 320, 50) andOptions:smokingDrinking andColumns:2];
    MIRadioButtonGroup *guestsButton =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 409, 320, 50) andOptions:guests andColumns:2];
    MIRadioButtonGroup *petsButton =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 479, 320, 50) andOptions:pets andColumns:2];
    [self.view addSubview:genderButton];
    [self.view addSubview:foodButton];
    [self.view addSubview:smokingDrinkingButton];
    [self.view addSubview:guestsButton];
    [self.view addSubview:petsButton];
    [genderButton setSelected:0];
    //NSInteger i = [genderButton getSelected];
    //[group clearAll];
    //[group removeButtonAtIndex:2];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)ContinueButton :(id)sender{
    [self performSegueWithIdentifier:@"propertyDescription" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyDescription"]) {
        ;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
