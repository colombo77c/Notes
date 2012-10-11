//
//  Note.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Location;

@interface Note : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *noteBody;
@property (strong,nonatomic) Location *location;
@end
