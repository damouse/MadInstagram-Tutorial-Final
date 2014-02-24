//
//  ViewController.h
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/24/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    __weak IBOutlet UILabel *labelHello;
}

- (IBAction)buttonHello:(id)sender;

@property (strong, nonatomic) NSMutableArray *posts;
@property (strong, nonatomic) NSString *maxNumberOfPosts;

@end
