//
//  GuideViewController.m
//  Evenire
//
//  Created by swati wasal on 17/07/17.
//  Copyright © 2017 swatiwasal. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

   
                      

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSArray *imgArr=@[[UIImage imageNamed:@"ip7stock1"],[UIImage imageNamed:@"ip7stock2"],[UIImage imageNamed:@"ip7stock3"],[UIImage imageNamed:@"ip7stock12"],[UIImage imageNamed:@"ip7stock13"]];
    for (int index=0; index<imgArr.count; index++) {
        
        CGRect imgFrame;
        
        //        imgFrame.origin.x=(self.scrollView.bounds.size.width)*index;              this is only used if it is for 1 screen
        imgFrame.origin.x=([[UIScreen mainScreen]bounds].size.width)*index;            //this is more useful for different screens
        imgFrame.origin.y=0;
        
        imgFrame.size=self.scrollView.bounds.size;
        
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:imgFrame];
        
        imgView.image=[imgArr objectAtIndex:index];
        
        [self.scrollView addSubview:imgView];
        
    }
    
    self.scrollView.contentSize=CGSizeMake(self.scrollView.bounds.size.width*(imgArr.count), self.scrollView.bounds.size.height);
    
    self.scrollView.bounces=NO;
    
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    
    ///pagination effect
    
    self.scrollView.pagingEnabled=YES;
    
    self.pageControl.numberOfPages=imgArr.count;
    self.pageControl.currentPage=0;
    
    
    
    self.scrollView.delegate=self;
    
    
    
    

}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger page=scrollView.contentOffset.x/scrollView.bounds.size.width;
    self.pageControl.currentPage=page;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pageControlActn:(UIPageControl *)sender {
    
    NSInteger constant=sender.currentPage;
    
    
    CGRect bounds=CGRectMake(self.scrollView.bounds.size.width*constant, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
    //  self.scrollView.contentOffset=CGPointMake(self.scrollView.bounds.size.width*constant, 0);
    
    [self.scrollView scrollRectToVisible:bounds animated:YES];
    
    
    
}
@end
