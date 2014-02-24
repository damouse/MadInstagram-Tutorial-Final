//
//  ImagesViewController.m
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/27/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import "ImagesViewController.h"
#import "PostsViewController.h"
#import "Post.h"

@interface ImagesViewController ()

@end

@implementation ImagesViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.maxNumberOfPosts == -1 || [self.posts count] < self.maxNumberOfPosts)
        return [self.posts count];
    else
        return self.maxNumberOfPosts;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Post *post = [self.posts objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:post.userName];
    [cell.detailTextLabel setText:post.caption];
    
    return cell;
}

#pragma mark - Tableview Data Source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PostsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"posts"];
    
    //remove the correct post from the array here, set controller's post property
    controller.post = [self.posts objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}
@end
