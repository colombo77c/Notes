//
//  NotesTableViewController.h
//  Notes
//
//  Created by Adam on 10/8/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNoteViewController.h"

@interface NotesTableViewController : UITableViewController <AddNoteViewControllerDelegate>


@property (strong,nonatomic) NSMutableArray* notes;
@end
