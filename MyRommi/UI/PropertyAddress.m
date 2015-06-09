//
//  PropertyAddress.m
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyAddress.h"
#import "PropertyPreferences.h"

@interface PropertyAddress ()
@property (nonatomic, strong) NSMutableDictionary *propertyAddress;
@property (nonatomic, strong) UIGestureRecognizer *tapper;
@end

@implementation PropertyAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    self.propertyAddress = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"house",@"",@"street",@"",@"city",@"",@"state",@"",@"postal_code",@"",@"country", nil];
    // Do any additional setup after loading the view.
    _tapper = [[UITapGestureRecognizer alloc]
               initWithTarget:self action:@selector(handleSingleTap:)];
    _tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapper];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if ([textField tag]==1) {
        
        [self.propertyAddress setValue:textField.text forKey:@"house"];
    }
    else if ([textField tag]==2){
        
        [self.propertyAddress setValue:textField.text forKey:@"street"];
    }
    else if ([textField tag]==3){
        
        [self.propertyAddress setValue:textField.text forKey:@"city"];
    }
    else if ([textField tag]==4){
        
        [self.propertyAddress setValue:textField.text forKey:@"state"];
    }
    else if ([textField tag]==5){
        
        [self.propertyAddress setValue:textField.text forKey:@"postal_code"];
    }
    else{
        
        [self.propertyAddress setValue:textField.text forKey:@"country"];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)ContinueButton :(id)sender{
    //self.propertyDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.propertyAddress,@"Address", nil];
    [self.propertyDictionary setObject:self.propertyAddress forKey:@"address"];
    [self performSegueWithIdentifier:@"propertyPreferences" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyPreferences"]) {
        PropertyPreferences *propertyPrefVC = [segue destinationViewController];
        propertyPrefVC.propertyDictionary = self.propertyDictionary;
    }
}

@end
