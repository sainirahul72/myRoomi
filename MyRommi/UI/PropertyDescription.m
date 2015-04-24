//
//  PropertyDescription.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyDescription.h"

@interface PropertyDescription ()

@end

@implementation PropertyDescription

- (void)viewDidLoad {
    [super viewDidLoad];
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
            [self.any setSelected:NO];
            [self.female setSelected:NO];
            break;
        case 2:
            [self.male setSelected:NO];
            [self.any setSelected:NO];
            [self.female setSelected:YES];
            break;
        case 3:
            [self.male setSelected:NO];
            [self.any setSelected:YES];
            [self.female setSelected:NO];
            break;

        default:
            break;
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
