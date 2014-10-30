//
//  ASScrollableMenuBar.h
//
//  Created by yanguango on 12/21/11.
//  Copyright (c) 2011 yanguango. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASScrollableMenuBar;

@protocol ASScrollableMenuBarDelegate <NSObject>
- (void)scrollableMenuBar:(ASScrollableMenuBar *)menuBar didSelectTabAtIndex:(NSInteger)index;
@end

@interface ASScrollableMenuBar : UIView <UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIImage *_leftImage;
    UIImage *_rightImage;
    UIImage *_itemBackImage;
    UIImage *_indicatorImage;
    UIButton *_leftButton;
    UIButton *_rightButton;
    NSArray *_menuItems;
    UIImageView *_indicatorView;
    id <ASScrollableMenuBarDelegate> _delegate;
}
@property (nonatomic, retain) NSArray *menuItems;
@property (nonatomic, assign) id <ASScrollableMenuBarDelegate> delegate;

@end
