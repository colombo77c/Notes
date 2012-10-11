//
//  NoteMapDetailViewController.m
//  Notes
//
//  Created by Adam on 10/9/12.
//  Copyright (c) 2012 Adam. All rights reserved.
//

#import "NoteMapDetailViewController.h"

@interface NoteMapDetailViewController ()

@end

@implementation NoteMapDetailViewController
@synthesize title;
@synthesize noteBody;
@synthesize tempNoteBody,tempTitle;
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
    title.text = tempTitle;
    noteBody.text = tempNoteBody;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
