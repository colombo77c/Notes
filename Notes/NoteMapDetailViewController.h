//
//  NoteMapDetailViewController.h
//  Notes
//
//  Created by Adam on 10/9/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteMapDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *title;
@property (strong, nonatomic) IBOutlet UITextView *noteBody;
@property NSString *tempTitle;
@property NSString *tempNoteBody;
@end
