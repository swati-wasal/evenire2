//
//  GuideViewController.h
//  Evenire
//
//  Created by swati wasal on 17/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *
scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)pageControlActn:(UIPageControl *)sender;


@end
