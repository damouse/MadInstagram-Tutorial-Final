//
//  SettingsViewController.m
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/27/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillDisappear:(BOOL)animated {
    if(![textfieldNumberOfImages.text isEqualToString:@""]) {
        ViewController *controller = [self.navigationController.viewControllers objectAtIndex:0];
        
        //set the string property on controller here
        controller.maxNumberOfPosts = textfieldNumberOfImages.text;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
