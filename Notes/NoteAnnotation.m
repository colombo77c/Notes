//
//  NoteAnnotation.m
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import "NoteAnnotation.h"

@implementation NoteAnnotation
@synthesize name = _name;
@synthesize noteBody = _noteBody;
@synthesize coordinate = _coordinate;
@synthesize detailButton;
@synthesize delegate;


- (id)initWithName:(NSString *)name body:(NSString *)body coordinate:(CLLocationCoordinate2D)coordinate
{
    if ((self = [super init])) {
        _name = [name copy];
        _noteBody = [body copy];
        _coordinate = coordinate;
        detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [detailButton addTarget:self action:@selector(detailButtonPushed) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(NSString *)title {
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown charge";
    else
        return _name;
}

-(NSString *)subtitle {
    return @"";
}


-(void)detailButtonPushed
{
    [self.delegate noteAnnotationDetailButtonPushed:self];
}

@end
