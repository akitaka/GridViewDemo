//
//  GVTFirstViewController.m
//  GridViewTabTest
//
//  Created by Tom HU on 2012/12/21.
//  Copyright (c) 2012年 Tom HU. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "GVTFirstViewController.h"
#import "GMGridView.h"
#import "Plist.h"

//////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ViewController (privates methods)
//////////////////////////////////////////////////////////////

@interface GVTFirstViewController () <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewTransformationDelegate, GMGridViewActionDelegate>
{
    __gm_weak GMGridView *_gmGridView;
    
    NSMutableArray *_data;
    __gm_weak NSMutableArray *_currentData;
}

@end

//////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ViewController implementation
//////////////////////////////////////////////////////////////

@implementation GVTFirstViewController

//////////////////////////////////////////////////////////////
#pragma mark controller events
//////////////////////////////////////////////////////////////

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = [[NSMutableArray alloc]init];
    for (int i = 0; i < [Plist readPlistNumber:@"icons"]; i ++)
    {
        [_data addObject:[[Plist readPlist:@"icons"]objectForKey:[NSString stringWithFormat:@"%d",i]]];
    }
    _currentData = _data;
    
    NSInteger spacing = 10;//INTERFACE_IS_PHONE ? 10 : 10;
    
    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];//self.view.bounds];
    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gmGridView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:gmGridView];
    _gmGridView = gmGridView;
    
    _gmGridView.style = GMGridViewStyleSwap;
    _gmGridView.itemSpacing = spacing;
    _gmGridView.minEdgeInsets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
    _gmGridView.centerGrid = YES;
    _gmGridView.actionDelegate = self;
    _gmGridView.sortingDelegate = self;
    _gmGridView.transformDelegate = self;
    _gmGridView.dataSource = self;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _gmGridView = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

//////////////////////////////////////////////////////////////
#pragma mark memory management
//////////////////////////////////////////////////////////////

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//////////////////////////////////////////////////////////////
#pragma mark orientation management
//////////////////////////////////////////////////////////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewDataSource
//////////////////////////////////////////////////////////////

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    NSLog(@"%i",[_currentData count]);
    return [_currentData count];
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return CGSizeMake(90, 90);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    //NSLog(@"Creating view indx %d", index);
    
    CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
        // create an UIView
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        
        // do some customization for my view
        view.backgroundColor = [UIColor clearColor];
        view.layer.masksToBounds = NO;
        view.layer.cornerRadius = 8;
        view.layer.shadowColor = [UIColor grayColor].CGColor;
        view.layer.shadowOffset = CGSizeMake(5, 5);
        view.layer.shadowPath = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
        view.layer.shadowRadius = 8;
        
        cell.contentView = view;
    }
    
    // create a button called btn
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-3, -13, 96, 96)];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    NSString *imageName = [NSString stringWithFormat:@"%@", [[_data objectAtIndex:index] objectForKey:@"name"]];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    // add button to my view
    [cell.contentView addSubview: btn];
    
    UILabel *myTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 68, 90, 21)];
    myTitleLabel.backgroundColor = [UIColor clearColor];
    myTitleLabel.text = [NSString stringWithFormat:@"%@", [[_data objectAtIndex:index] objectForKey:@"title"]];
    myTitleLabel.textAlignment = UITextAlignmentCenter;
    [cell.contentView addSubview:myTitleLabel];
    
    return cell;
}


- (BOOL)GMGridView:(GMGridView *)gridView canDeleteItemAtIndex:(NSInteger)index
{
    return YES; //index % 2 == 0;
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewActionDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    NSLog(@"Did tap at index %d", position);
}

- (void)GMGridViewDidTapOnEmptySpace:(GMGridView *)gridView
{
    NSLog(@"Tap on empty space");
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewSortingDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didStartMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor clearColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     }
                     completion:nil
     ];
}

- (void)GMGridView:(GMGridView *)gridView didEndMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor clearColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil
     ];
}

- (BOOL)GMGridView:(GMGridView *)gridView shouldAllowShakingBehaviorWhenMovingCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    return YES;
}

- (void)GMGridView:(GMGridView *)gridView moveItemAtIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex
{
    NSLog(@"%i     %i",oldIndex,newIndex);
    NSObject *object = [_currentData objectAtIndex:oldIndex];
    [_currentData removeObject:object];
    [_currentData insertObject:object atIndex:newIndex];
}

- (void)GMGridView:(GMGridView *)gridView exchangeItemAtIndex:(NSInteger)index1 withItemAtIndex:(NSInteger)index2
{
    [Plist exchangePlist:@"icons" data1:[NSString stringWithFormat:@"%d",index1] data2:[NSString stringWithFormat:@"%d",index2]];
    [_currentData exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
}

//////////////////////////////////////////////////////////////
#pragma mark DraggableGridViewTransformingDelegate
//////////////////////////////////////////////////////////////

- (CGSize)GMGridView:(GMGridView *)gridView sizeInFullSizeForCell:(GMGridViewCell *)cell atIndex:(NSInteger)index inInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return CGSizeMake(320, 210);
}

- (UIView *)GMGridView:(GMGridView *)gridView fullSizeViewForCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    UIView *fullView = [[UIView alloc] init];
    fullView.backgroundColor = [UIColor yellowColor];
    fullView.layer.masksToBounds = NO;
    fullView.layer.cornerRadius = 8;
    
    CGSize size = [self GMGridView:gridView sizeInFullSizeForCell:cell atIndex:index inInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    fullView.bounds = CGRectMake(0, 0, size.width, size.height);
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor blueColor];
    [fullView addSubview:btn];
    return fullView;
}

- (void)GMGridView:(GMGridView *)gridView didStartTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor blueColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     }
                     completion:nil];
}

- (void)GMGridView:(GMGridView *)gridView didEndTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor purpleColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil];
}

//////////////////////////////////////////////////////////////
#pragma mark private methods
//////////////////////////////////////////////////////////////

- (IBAction)testBtn:(id)sender {
    NSLog(@"click get: %i",[Plist readPlistNumber:@"icons"]);
}
@end