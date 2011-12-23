//
//  ViewController.h
//  ASScrollableMenuBar
//
//  Created by bl0ckme on 12/21/11.
//  Copyright (c) 2011 bl0ckme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASScrollableMenuBar.h"

@interface ViewController : UIViewController <ASScrollableMenuBarDelegate>

@property (retain, nonatomic) IBOutlet UILabel *flagLabel;
@property (retain, nonatomic) IBOutlet ASScrollableMenuBar *menuBar;
@end
