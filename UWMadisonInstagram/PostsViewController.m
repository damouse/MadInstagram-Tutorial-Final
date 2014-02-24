//
//  PostsViewController.m
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/27/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import "PostsViewController.h"

@interface PostsViewController ()

@end

@implementation PostsViewController

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


- (void) viewWillAppear:(BOOL)animated {
    //form the url object here
    NSURL *url = [NSURL URLWithString:self.post.imageURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    [imagePhoto setImage:[UIImage imageWithData:data]];
    
    [textviewComment setText:self.post.caption];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
