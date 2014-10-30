//
//  ViewController.m
//  ASScrollableMenuBar
//
//  Created by yanguango on 12/21/11.
//  Copyright (c) 2011 yanguango. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize flagLabel;
@synthesize menuBar;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.menuBar.delegate = self;
    self.menuBar.menuItems = [NSArray arrayWithObjects:@"OBJC", @"RUBY", @"JAVASCRIPT",
                              @"PYTHON", @"CSS", @"HTML", @"JAVA",  nil];
    self.flagLabel.text = @"select menu item 0";
}

- (void)viewDidUnload
{
    [self setMenuBar:nil];
    [self setFlagLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [menuBar release];
    [flagLabel release];
    [super dealloc];
}

#pragma mark - ASScrollableMenuBarDelegate
- (void)scrollableMenuBar:(ASScrollableMenuBar *)menuBar didSelectTabAtIndex:(NSInteger)index {
    self.flagLabel.text = [NSString stringWithFormat:@"select menu item %d", index];
}
@end
