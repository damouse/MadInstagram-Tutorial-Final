//
//  ViewController.m
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/24/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "ImagesViewController.h"

@interface ViewController () {
    NSMutableData *jsonResponse;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    jsonResponse = [[NSMutableData alloc] init];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://pages.cs.wisc.edu/~mihnea/instagram.json"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    [connection start];
    
    if(self.maxNumberOfPosts == nil) {
        self.maxNumberOfPosts = @"-1";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonHello:(id)sender {
    [labelHello setText:@"UW Madison Instagram"];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"images"]) {
        ImagesViewController *controller = (ImagesViewController *)segue.destinationViewController;
        controller.posts = self.posts;
        controller.maxNumberOfPosts = [self.maxNumberOfPosts intValue];
    }
}

#pragma mark NSURLConnection Methods
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [jsonResponse setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [jsonResponse appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jsonResponse options:NSJSONReadingAllowFragments error:&error];
    
    NSArray *posts = [data objectForKey:@"data"];
    
    self.posts = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [posts count]; i++) {
        Post *post = [[Post alloc] init];
        NSDictionary *entry = [posts objectAtIndex:i];
        
        post.userName = [[entry objectForKey:@"user"] objectForKey:@"full_name"];
        post.imageURL = [[[entry objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
        post.caption = [[entry objectForKey:@"caption"] objectForKey:@"text"];
        
        [self.posts addObject:post];
    }
    
    [connection cancel];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error During Connection: %@", [error description]);
}

@end
