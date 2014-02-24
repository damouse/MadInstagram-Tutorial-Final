//
//  ImagesViewController.h
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/27/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesViewController : UIViewController {
    
    __weak IBOutlet UITableView *tableImages;
}

@property (strong, nonatomic) NSArray *posts;
@property int maxNumberOfPosts;

@end
