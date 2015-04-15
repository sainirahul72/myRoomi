//
//  PropertyAddress.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyAddress.h"

@interface PropertyAddress ()

@end

@implementation PropertyAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ContinueButton :(id)sender{
    [self performSegueWithIdentifier:@"propertyPreferences" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyPreferences"]) {
        ;
    }
}


@end
