//
//  MIRadioButtonGroup.h
//  MyRommi
//
//  Created by Rahul Saini on 4/14/15.
//  Copyright (c) 2015 Rahul Saini. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface MIRadioButtonGroup : UIView {
	NSMutableArray *radioButtons;

}

@property (nonatomic,retain) NSMutableArray *radioButtons;

- (id)initWithFrame:(CGRect)frame andOptions:(NSArray *)options andColumns:(int)columns;
-(IBAction) radioButtonClicked:(UIButton *) sender;
-(void) removeButtonAtIndex:(int)index;
-(void) setSelected:(int) index;
-(void)clearAll;
-(NSInteger) getSelected;
@end
