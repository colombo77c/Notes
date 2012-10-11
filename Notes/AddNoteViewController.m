//
//  AddNoteViewController.m
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController
@synthesize title,noteBody,addButton,locationManager,noteLocation;
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
	// Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:tap];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    [title becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyBoard
{
    [noteBody resignFirstResponder];
    [title resignFirstResponder];
}

- (IBAction)addNote:(id)sender
{
    Note* note = [[Note alloc] init];
    note.title = [title text];
    note.noteBody = [noteBody text];
    Location* location = [[Location alloc] init];
    if(noteLocation != nil)
    {
        location.latitude = [NSNumber numberWithDouble:noteLocation.coordinate.latitude];
        location.longitude = [NSNumber numberWithDouble:noteLocation.coordinate.longitude];
    }
    note.location = location;
    [self.delegate addNoteViewController:self didAddNote:note];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate addNoteViewControllerDidCancel:self];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    noteLocation = [locations lastObject];
}
@end
