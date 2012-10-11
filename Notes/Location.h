//
//  Location.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Note;

@interface Location : NSObject

@property (strong,nonatomic) NSNumber *latitude;
@property (strong,nonatomic) NSNumber *longitude;
@property (strong,nonatomic) Note *note;

@end
