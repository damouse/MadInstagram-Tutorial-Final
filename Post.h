//
//  Post.h
//  UWMadisonInstagram
//
//  Created by Mickey Barboi on 1/28/14.
//  Copyright (c) 2014 Mickey Barboi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *caption;

@end
