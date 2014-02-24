//
//  PostsViewController.h
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/27/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostsViewController : UIViewController {
    
    __weak IBOutlet UIImageView *imagePhoto;
    __weak IBOutlet UITextView *textviewComment;
}

@property (strong, nonatomic) Post *post;

@end
