//
//  NoteMapViewController.m
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import "NoteMapViewController.h"
#import "NotesTableViewController.h"
@interface NoteMapViewController ()

@end

@implementation NoteMapViewController
@synthesize notes;
@synthesize map;
@synthesize locationManager;
@synthesize currentAnnotation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    map.delegate = self;
    
    
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UITabBarController *tabBarController = [self tabBarController];
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
    NotesTableViewController *notesTableViewController = [[navigationController viewControllers] objectAtIndex:0];
    self.notes = notesTableViewController.notes;
    [self plotNotes];
}


- (void)plotNotes
{
    for(Note *n in notes)
    {
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = n.location.latitude.doubleValue;
        coordinate.longitude = n.location.longitude.doubleValue;
        NoteAnnotation *annotation = [[NoteAnnotation alloc] initWithName:n.title body:n.noteBody coordinate:coordinate];
        annotation.delegate = self;
        [self.map addAnnotation:annotation];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // Define your reuse identifier.
    static NSString *identifier = @"NoteAnnotation";
    
    if ([annotation isKindOfClass:[NoteAnnotation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [(NoteAnnotation*)annotation detailButton];
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    MKCoordinateRegion region;
    region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,1000,1000);
    
    
    [mv setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)noteAnnotationDetailButtonPushed:(NoteAnnotation *)annotation
{
    currentAnnotation = annotation;
    [self performSegueWithIdentifier:@"NoteMapDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"NoteMapDetail"])
    {
        NoteMapDetailViewController *noteMapDetailViewController = segue.destinationViewController;
        noteMapDetailViewController.tempTitle = [currentAnnotation title];
        noteMapDetailViewController.tempNoteBody = [currentAnnotation noteBody];
    }
}

@end
