//
//  NoteMapViewController.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteAnnotation.h"
#import "NoteMapDetailViewController.h"

@interface NoteMapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate, NoteAnnotationDelegate>


@property NSArray *notes;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NoteAnnotation *currentAnnotation;
@end
