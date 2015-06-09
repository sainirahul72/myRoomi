//
//  AddProperty.m
//  MyRommi
//
//  Created by Rahul Saini on 12/04/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//

#import "AddProperty.h"
#import "PropertyTypeCell.h"
#import "PropertyAddress.h"
#import "PropertyLocation.h"

@interface AddProperty ()
@property (nonatomic, strong) NSMutableDictionary * propertyDict;
@property int curProp;
@end

@implementation AddProperty

- (void)viewDidLoad {
    [super viewDidLoad];
    self.propertyDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"",@"house_type", nil];
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
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
    return 5;
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
        self.curProp=(int)indexPath.row-1;
        [self.propertyDict setValue:[NSString stringWithFormat:@"%d",self.curProp] forKey:@"house_type"];
        [self performSegueWithIdentifier:@"propertyLocation" sender:self];
        
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"propertyLocation"]) {
        PropertyLocation *propertyLocationVC = [segue destinationViewController];
        propertyLocationVC.propertyType = self.propertyDict;
        //self.propertyType[self.curProp];
    }
}



@end
