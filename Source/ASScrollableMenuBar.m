//
//  ASScrollableMenuBar.m
//
//  Created by yanguango on 12/21/11.
//  Copyright (c) 2011 yanguango. All rights reserved.
//

#import "ASScrollableMenuBar.h"

@implementation ASScrollableMenuBar
@synthesize menuItems = _menuItems;
@synthesize delegate = _delegate;

- (void)baseInit {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    [_scrollView setBackgroundColor:[UIColor colorWithRed:77/255.0 green:142/255.0 blue:193/255.0 alpha:1.0]];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO; 
    _scrollView.delegate = self;
    _leftImage = [UIImage imageNamed:@"left_button"];
    _rightImage = [UIImage imageNamed:@"right_button"];
    _itemBackImage = [UIImage imageNamed:@"menu_item_back"];
    _indicatorImage = [UIImage imageNamed:@"menu_bar_indicator"];
    _indicatorView = [[UIImageView alloc] initWithImage:_indicatorImage];
    _menuItems = [[NSArray alloc] init];
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftButton setImage:_leftImage forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(scrollToLeft) forControlEvents:UIControlEventTouchUpInside];
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setImage:_rightImage forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(scrollToRight) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_scrollView];
    [self addSubview:_leftButton];
    [self addSubview:_rightButton];
    [_scrollView addSubview:_indicatorView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)layoutSubviews {
    _leftButton.frame = CGRectMake(0, 0, _leftImage.size.width, _leftImage.size.height);
    _rightButton.frame = CGRectMake(self.frame.size.width - _rightImage.size.width, 0,
                                    _rightImage.size.width, _rightImage.size.height);
    _indicatorView.frame = CGRectMake((_itemBackImage.size.width  - _indicatorImage.size.width) / 2,
                                      self.frame.size.height - _indicatorImage.size.height,
                                      _indicatorImage.size.width,
                                      _indicatorImage.size.height);
}

- (void)selectMenuItemAtIndex:(id)sender {
    int index = ((UIButton *)sender).tag;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect newFrame = _indicatorView.frame;
        newFrame.origin.x = _itemBackImage.size.width * (index + 0.5)  - _indicatorImage.size.width / 2;
        _indicatorView.frame = newFrame;
    }];
    if (_delegate && [_delegate respondsToSelector:@selector(scrollableMenuBar:didSelectTabAtIndex:)]) {
        [_delegate scrollableMenuBar:self didSelectTabAtIndex:index];
    }
}

- (void)setMenuItems:(NSArray *)menuItems {
    [_menuItems autorelease];
    _menuItems = menuItems;
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    for (int i=0; i<[menuItems count];i++) {
        NSString *itemTitle = [menuItems objectAtIndex:i];
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton setBackgroundImage:_itemBackImage forState:UIControlStateNormal];
        [itemButton setTitle:itemTitle forState:UIControlStateNormal];
        [itemButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        itemButton.frame = CGRectMake(_itemBackImage.size.width*i, 0, 
                                      _itemBackImage.size.width, _itemBackImage.size.height);
        itemButton.tag = i;
        [itemButton addTarget:self action:@selector(selectMenuItemAtIndex:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:itemButton];
        
    }
    [_scrollView setContentSize:CGSizeMake(_itemBackImage.size.width*[_menuItems count], 
                                           self.frame.size.height)];
    [_scrollView addSubview:_indicatorView];
}

- (void)scrollToLeft {
    CGPoint currentOffset = _scrollView.contentOffset;
    currentOffset.x = currentOffset.x - _itemBackImage.size.width;
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = currentOffset;
    }];
    
}

- (void)scrollToRight {
    CGPoint currentOffset = _scrollView.contentOffset;
    currentOffset.x = currentOffset.x + _itemBackImage.size.width;
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = currentOffset;
    }];
}

- (void)updateLeftRightButton {
    [_leftButton setHidden:_scrollView.contentOffset.x < _itemBackImage.size.width / 2];
    [_rightButton setHidden:_scrollView.contentOffset.x > _scrollView.contentSize.width - 
     self.frame.size.width - _itemBackImage.size.width / 2];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateLeftRightButton];
}
@end
