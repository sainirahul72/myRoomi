//
//  AddProperty.m
//  MyRommi
//
//  Created by Rahul Saini on 4/12/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "AddProperty.h"
#import "PropertyTypeCell.h"
#import "PropertyAddress.h"

@interface AddProperty ()
@property (nonatomic, strong) NSArray *propertyType;
@property int curProp;
@end

@implementation AddProperty

- (void)viewDidLoad {
    [super viewDidLoad];
    self.propertyType = [NSArray arrayWithObjects:@"Apartment",@"House",@"Banglow",@"Villa", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StaticPropertyCell"];
        return cell;
    }
    else if(indexPath.row==1){
        PropertyTypeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PropertyTypeCell"];
        cell.propertyType.text = @"Apartment";
        return cell;
    }
    else if(indexPath.row==2){
        PropertyTypeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PropertyTypeCell"];
        cell.propertyType.text = @"House";
        return cell;
    }
    else if(indexPath.row==3){
        PropertyTypeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PropertyTypeCell"];
        cell.propertyType.text = @"Banglow";
        return cell;
    }
    else{
        PropertyTypeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PropertyTypeCell"];
        cell.propertyType.text = @"Villa";
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 260.0;
    }
    else{
        return 56;
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row) {
        self.curProp=(int)indexPath.row;
        [self performSegueWithIdentifier:@"propertyAddress" sender:self];
        
    }
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyAddress"]) {
        PropertyAddress *propertyAddressVC = [segue destinationViewController];
        propertyAddressVC.propertyType = self.propertyType[self.curProp];
    }
}
/*
 NSArray *options =[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",nil];
	MIRadioButtonGroup *group =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 20, 320, 75) andOptions:options andColumns:4];
 //[group setSelected:1];
	//[group clearAll];
	//[group removeButtonAtIndex:2];
 */


@end
