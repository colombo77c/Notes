//
//  AddNoteViewController.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Note.h"
#import "Location.h"

@class AddNoteViewController;

@protocol AddNoteViewControllerDelegate <NSObject>
- (void)addNoteViewControllerDidCancel:(AddNoteViewController*)controller;
- (void)addNoteViewControllerDidSave:(AddNoteViewController*)controller;
- (void)addNoteViewController:(AddNoteViewController*)controller didAddNote:(Note*)note;
@end

@interface AddNoteViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *title;
@property (strong, nonatomic) IBOutlet UITextView *noteBody;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, weak) id <AddNoteViewControllerDelegate> delegate;
@property (strong, nonatomic) CLLocationManager* locationManager;
@property CLLocation *noteLocation;
- (IBAction)addNote:(id)sender;
- (IBAction)cancel:(id)sender;
@end
