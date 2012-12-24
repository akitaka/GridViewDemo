//
//  GVTFirstViewController.m
//  GridViewTabTest
//
//  Created by Tom HU on 2012/12/21.
//  Copyright (c) 2012年 Tom HU. All rights reserved.
//

//#import "GVTFirstViewController.h"
//
//@interface GVTFirstViewController ()
//
//@end
//
//@implementation GVTFirstViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end




#import <QuartzCore/QuartzCore.h>
#import "GVTFirstViewController.h"
#import "GMGridView.h"
#import "Plist.h"
//#import "OptionsViewController.h"

//#define NUMBER_ITEMS_ON_LOAD 8
//#define NUMBER_ITEMS_ON_LOAD2 30

//////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ViewController (privates methods)
//////////////////////////////////////////////////////////////

@interface GVTFirstViewController () <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewTransformationDelegate, GMGridViewActionDelegate>
{
    __gm_weak GMGridView *_gmGridView;
//    UINavigationController *_optionsNav;
//    UIPopoverController *_optionsPopOver;
    
    NSMutableArray *_data;
//    NSMutableArray *_data2;
    __gm_weak NSMutableArray *_currentData;
//    NSInteger _lastDeleteItemIndexAsked;
}

//- (void)addMoreItem;
//- (void)removeItem;
//- (void)refreshItem;
//- (void)presentInfo;
//- (void)presentOptions:(UIBarButtonItem *)barButton;
//- (void)optionsDoneAction;
//- (void)dataSetChange:(UISegmentedControl *)control;

@end


//////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ViewController implementation
//////////////////////////////////////////////////////////////

@implementation GVTFirstViewController

//- (id)init
//{
//    if ((self =[super init]))
//    {
//        self.title = @"Demo 1";
//
//        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMoreItem)];
//
//        UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        space.width = 10;
//
//        UIBarButtonItem *removeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeItem)];
//
//        UIBarButtonItem *space2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        space2.width = 10;
//
//        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshItem)];
//
//        if ([self.navigationItem respondsToSelector:@selector(leftBarButtonItems)]) {
//            self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:addButton, space, removeButton, space2, refreshButton, nil];
//        }else {
//            self.navigationItem.leftBarButtonItem = addButton;
//        }
//
//        UIBarButtonItem *optionsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(presentOptions:)];
//
//        if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItems)]) {
//            self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:optionsButton, nil];
//        }else {
//            self.navigationItem.rightBarButtonItem = optionsButton;
//        }
//
//        _data = [[NSMutableArray alloc] init];
//
//        for (int i = 0; i < NUMBER_ITEMS_ON_LOAD; i ++)
//        {
//            [_data addObject:[NSString stringWithFormat:@"A %d", i]];
//        }
//
//        _data2 = [[NSMutableArray alloc] init];
//
//        for (int i = 0; i < NUMBER_ITEMS_ON_LOAD2; i ++)
//        {
//            [_data2 addObject:[NSString stringWithFormat:@"B %d", i]];
//        }
//
//        _currentData = _data;
//    }
//
//    return self;
//}

//////////////////////////////////////////////////////////////
#pragma mark controller events
//////////////////////////////////////////////////////////////

//- (void)loadView
//{
//    [super loadView];
    //    self.view.backgroundColor = [UIColor whiteColor];
    //
    //    NSInteger spacing = INTERFACE_IS_PHONE ? 10 : 15;
    //
    //    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:self.view.bounds];
    //    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    gmGridView.backgroundColor = [UIColor clearColor];
    //    [self.view addSubview:gmGridView];
    //    _gmGridView = gmGridView;
    //
    //    _gmGridView.style = GMGridViewStyleSwap;
    //    _gmGridView.itemSpacing = spacing;
    //    _gmGridView.minEdgeInsets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
    //    _gmGridView.centerGrid = YES;
    //    _gmGridView.actionDelegate = self;
    //    _gmGridView.sortingDelegate = self;
    //    _gmGridView.transformDelegate = self;
    //    _gmGridView.dataSource = self;
    
    //    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    //    infoButton.frame = CGRectMake(self.view.bounds.size.width - 40,
    //                                  self.view.bounds.size.height - 40,
    //                                  40,
    //                                  40);
    //    infoButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    //    [infoButton addTarget:self action:@selector(presentInfo) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:infoButton];
    //
    //    UISegmentedControl *dataSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"DataSet 1", @"DataSet 2", nil]];
    //    [dataSegmentedControl sizeToFit];
    //    dataSegmentedControl.frame = CGRectMake(5,
    //                                            self.view.bounds.size.height - dataSegmentedControl.bounds.size.height - 5,
    //                                            dataSegmentedControl.bounds.size.width,
    //                                            dataSegmentedControl.bounds.size.height);
    //    dataSegmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    //    dataSegmentedControl.tintColor = [UIColor greenColor];
    //    dataSegmentedControl.selectedSegmentIndex = 0;
    //    [dataSegmentedControl addTarget:self action:@selector(dataSetChange:) forControlEvents:UIControlEventValueChanged];
    //    [self.view addSubview:dataSegmentedControl];
    
    
    //    OptionsViewController *optionsController = [[OptionsViewController alloc] init];
    //    optionsController.gridView = gmGridView;
    //    optionsController.contentSizeForViewInPopover = CGSizeMake(400, 500);
    //
    //    _optionsNav = [[UINavigationController alloc] initWithRootViewController:optionsController];
    //
    //    if (INTERFACE_IS_PHONE)
    //    {
    //        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(optionsDoneAction)];
    //        optionsController.navigationItem.rightBarButtonItem = doneButton;
    //    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _data = [[NSMutableArray alloc]init];
//    NSLog(@"viewDidLoad: %i",[Plist readPlistNumber:@"icons"]);
    for (int i = 0; i < [Plist readPlistNumber:@"icons"]; i ++)
    {
//        [_data addObject:[NSString stringWithFormat:@"%d", i]];
        [_data addObject:[[Plist readPlist:@"icons"]objectForKey:[NSString stringWithFormat:@"%d",i]]];
    }
//    [_data addObject:[Plist readPlist:@"icons"]];
    _currentData = _data;
//    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
//    _gmGridView.mainSuperView = self.navigationController.view; //[UIApplication sharedApplication].keyWindow.rootViewController.view;
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
//        cell.contentView = [[UIImageView alloc] init];
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
//    NSLog(@"hellooooo %@",[[_data objectAtIndex:index] objectForKey:@"name"]);
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

//- (void)GMGridView:(GMGridView *)gridView processDeleteActionForItemAtIndex:(NSInteger)index
//{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you want to delete this item?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
//    
//    [alert show];
//    
//    _lastDeleteItemIndexAsked = index;
//}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1)
//    {
//        [_currentData removeObjectAtIndex:_lastDeleteItemIndexAsked];
//        [_gmGridView removeObjectAtIndex:_lastDeleteItemIndexAsked withAnimation:GMGridViewItemAnimationFade];
//    }
//}

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
//    [Plist exchangePlist:@"icons" data1:[NSString stringWithFormat:@"%d",oldIndex] data2:[NSString stringWithFormat:@"%d",newIndex]];
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
//    if (INTERFACE_IS_PHONE)
//    {
//        if (UIInterfaceOrientationIsLandscape(orientation))
//        {
            return CGSizeMake(320, 210);
//        }
//        else
//        {
//            return CGSizeMake(300, 310);
//        }
//    }
//    else
//    {
//        if (UIInterfaceOrientationIsLandscape(orientation))
//        {
//            return CGSizeMake(700, 530);
//        }
//        else
//        {
//            return CGSizeMake(600, 500);
//        }
//    }
}

- (UIView *)GMGridView:(GMGridView *)gridView fullSizeViewForCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    UIView *fullView = [[UIView alloc] init];
    fullView.backgroundColor = [UIColor yellowColor];
    fullView.layer.masksToBounds = NO;
    fullView.layer.cornerRadius = 8;
    
    CGSize size = [self GMGridView:gridView sizeInFullSizeForCell:cell atIndex:index inInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    fullView.bounds = CGRectMake(0, 0, size.width, size.height);
    
//    UILabel *label = [[UILabel alloc] initWithFrame:fullView.bounds];
//    label.text = [NSString stringWithFormat:@"Fullscreen View for cell at index %d", index];
//    label.textAlignment = UITextAlignmentCenter;
//    label.backgroundColor = [UIColor clearColor];
//    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    
////    if (INTERFACE_IS_PHONE)
////    {
//        label.font = [UIFont boldSystemFontOfSize:15];
//    }
//    else
//    {
//        label.font = [UIFont boldSystemFontOfSize:20];
//    }
    
//    [fullView addSubview:label];
    
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

//- (void)GMGridView:(GMGridView *)gridView didEnterFullSizeForCell:(UIView *)cell
//{
//    
//}

//////////////////////////////////////////////////////////////
#pragma mark private methods
//////////////////////////////////////////////////////////////

//- (void)addMoreItem
//{
//    // Example: adding object at the last position
//    NSString *newItem = [NSString stringWithFormat:@"%d", (int)(arc4random() % 1000)];
//    
//    [_currentData addObject:newItem];
//    [_gmGridView insertObjectAtIndex:[_currentData count] - 1 withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
//}
//
//- (void)removeItem
//{
//    // Example: removing last item
//    if ([_currentData count] > 0)
//    {
//        NSInteger index = [_currentData count] - 1;
//        
//        [_gmGridView removeObjectAtIndex:index withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
//        [_currentData removeObjectAtIndex:index];
//    }
//}
//
//- (void)refreshItem
//{
//    // Example: reloading last item
//    if ([_currentData count] > 0)
//    {
//        int index = [_currentData count] - 1;
//        
//        NSString *newMessage = [NSString stringWithFormat:@"%d", (arc4random() % 1000)];
//        
//        [_currentData replaceObjectAtIndex:index withObject:newMessage];
//        [_gmGridView reloadObjectAtIndex:index withAnimation:GMGridViewItemAnimationFade | GMGridViewItemAnimationScroll];
//    }
//}
//
//- (void)presentInfo
//{
//    NSString *info = @"Long-press an item and its color will change; letting you know that you can now move it around. \n\nUsing two fingers, pinch/drag/rotate an item; zoom it enough and you will enter the fullsize mode";
//    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info"
//                                                        message:info
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//    
//    [alertView show];
//}

//- (void)dataSetChange:(UISegmentedControl *)control
//{
//    _currentData = ([control selectedSegmentIndex] == 0) ? _data : _data2;
//    
//    [_gmGridView reloadData];
//}

//- (void)presentOptions:(UIBarButtonItem *)barButton
//{
//    if (INTERFACE_IS_PHONE)
//    {
//        [self presentModalViewController:_optionsNav animated:YES];
//    }
//    else
//    {
//        if(![_optionsPopOver isPopoverVisible])
//        {
//            if (!_optionsPopOver)
//            {
//                _optionsPopOver = [[UIPopoverController alloc] initWithContentViewController:_optionsNav];
//            }
//            
//            [_optionsPopOver presentPopoverFromBarButtonItem:barButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else
//        {
//            [self optionsDoneAction];
//        }
//    }
//}

//- (void)optionsDoneAction
//{
//    if (INTERFACE_IS_PHONE)
//    {
//        [self dismissModalViewControllerAnimated:YES];
//    }
//    else
//    {
//        [_optionsPopOver dismissPopoverAnimated:YES];
//    }
//}

- (IBAction)testBtn:(id)sender {
    NSLog(@"click get: %i",[Plist readPlistNumber:@"icons"]);
}
@end