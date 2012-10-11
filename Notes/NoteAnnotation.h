//
//  NoteAnnotation.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Note.h"

@class NoteAnnotation;

@protocol NoteAnnotationDelegate <NSObject>
-(void)noteAnnotationDetailButtonPushed:(NoteAnnotation*)annotation;
@end

@interface NoteAnnotation : NSObject <MKAnnotation>
{
    NSString *_name;
    NSString *_noteBody;
    CLLocationCoordinate2D _coordinate;
}

@property (copy) NSString *name;
@property (copy) NSString *noteBody;
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) UIButton *detailButton;
@property (nonatomic, weak) id <NoteAnnotationDelegate> delegate;
- (id)initWithName:(NSString*)name body:(NSString*)body coordinate:(CLLocationCoordinate2D)coordinate;
@end
