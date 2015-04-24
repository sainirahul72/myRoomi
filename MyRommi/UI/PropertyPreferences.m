//
//  PropertyPreferences.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "PropertyPreferences.h"
int student=0, working=0, Entrepreneur=0;
@interface PropertyPreferences ()

@end

@implementation PropertyPreferences

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 6;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==0) {
//        GenderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gender"];
//        return cell;
//    }
//    else if(indexPath.row==1){
//        OccupationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"occupation"];
//        return cell;
//    }
//    else if(indexPath.row==2){
//        FoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"food"];
//        return cell;
//    }
//    else if(indexPath.row==3){
//        SmokingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"smoking"];
//        return cell;
//    }
//    else if (indexPath.row==4){
//        GuestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guest"];
//        return cell;
//    }
//    else{
//        PetsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pets"];
//        return cell;
//    }
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row<3) {
//        return 90.0;
//    }
//    else{
//        return 70.0;
//    }
//}
//
//
//
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==0) {
//
//    }
//    else if (indexPath.row==1){
//        
//    }
//    else if (indexPath.row==2){
//        
//    }
//    else if (indexPath.row==3){
//        
//    }
//    else if (indexPath.row==4){
//        
//    }
//    else{
//        
//    }
//}

-(IBAction)Button_Selection:(id)sender
{
    switch ([sender tag]) {
        case 1:
            [self.male setSelected:YES];
            [self.anyGender setSelected:NO];
            [self.female setSelected:NO];
            break;
        case 2:
            [self.male setSelected:NO];
            [self.anyGender setSelected:NO];
            [self.female setSelected:YES];
            break;
        case 3:
            [self.male setSelected:NO];
            [self.anyGender setSelected:YES];
            [self.female setSelected:NO];
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
            break;
        case 9:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:YES];
            [self.anyFood setSelected:NO];
            break;
        case 10:
            [self.veg setSelected:NO];
            [self.nonVeg setSelected:NO];
            [self.anyFood setSelected:YES];
            break;
        
        
        case 11:
            [self.SmokingAllowed setSelected:YES];
            [self.SmokingNotAllowed setSelected:NO];
            break;
        case 12:
            [self.SmokingAllowed setSelected:NO];
            [self.SmokingNotAllowed setSelected:YES];
            break;
        
        
        case 13:
            [self.GuestAllowed setSelected:YES];
            [self.GuestNotAllowed setSelected:NO];
            break;
        case 14:
            [self.GuestAllowed setSelected:NO];
            [self.GuestNotAllowed setSelected:YES];
            break;
        
        
        case 15:
            [self.PetsAllowed setSelected:YES];
            [self.PetsNotAllowed setSelected:NO];
            break;
        case 16:
            [self.PetsAllowed setSelected:NO];
            [self.PetsNotAllowed setSelected:YES];
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
