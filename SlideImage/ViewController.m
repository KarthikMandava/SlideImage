//
//  ViewController.m
//  SlideImage
//
//  Created by Intellisense Technology on 01/11/16.
//  Copyright © 2016 intellisense Technology. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    NSMutableArray *arrayForImages;
    NSInteger count;
    NSInteger previousValue;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    
    for (int i=0;i<4;i++)
    {
        NSMutableDictionary *dict1=[[NSMutableDictionary alloc] init];
        [dict1 setValue:@"Karthik" forKey:@"name"];
        [dict1 setValue:@"123456" forKey:@"phone"];
        [dict setObject:dict1 forKey:[NSString stringWithFormat:@"data%i",i]];
    }
    
    NSLog(@"%@",dict);

   
    NSMutableArray *dictAllValues=[NSMutableArray arrayWithArray:[dict allValues]];
    NSLog(@"%@",dictAllValues);

    for (NSDictionary *dict in dictAllValues)
    {
        NSLog(@"%@",[dict valueForKey:@"name"]);
    }
    
    
  //    arrayForImages=[[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"1.png"],
//                   [UIImage imageNamed:@"2.png"],
//                   [UIImage imageNamed:@"3.png"],
//                    [UIImage imageNamed:@"4.png"],
//                    [UIImage imageNamed:@"5.png"],nil];
     [self.navigationController.navigationBar setHidden:NO];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"5.png"] forBarMetrics:UIBarMetricsDefault];
//    for (UIView *view in self.navigationController.navigationBar.subviews) {
//        for (UIView *view2 in view.subviews) {
//            if ([view2 isKindOfClass:[UIImageView class]]) {
//                [view2 removeFromSuperview];
//            }
//        }
//    }
    
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
//                                      forBarPosition:UIBarPositionAny
//                                          barMetrics:UIBarMetricsDefault];
//    
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    arrayForImages=[[NSMutableArray alloc] initWithObjects:@"1.png",
                    @"2.png",
                    @"3.png",
                    @"4.png",
                    @"5.png",nil];

    count=0;
    previousValue = 0;
//    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0
//                                             target:self
//                                           selector:@selector(onTimer)
//                                           userInfo:nil
//                                            repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    [timer fire];
    _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count]];
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
//    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
//    
//    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
//    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
//    
//    [_imagVw addGestureRecognizer:swipeLeft];
//    [_imagVw addGestureRecognizer:swipeRight];
//    swipeLeft.delegate=self;
//    swipeRight.delegate=self;
//    [_imagVw setUserInteractionEnabled:YES];
    
    
//    SEL aSelector = @selector(run);
//    
//    [self performSelector:aSelector];
    
}

-(void)run
{
    NSLog(@"WTF");
}


-(void)onTimer
{
    if (count<arrayForImages.count)
    {
        CATransition *animation = [CATransition animation];
        [animation setDelegate:self];
        [animation setType:kCATransitionPush];
        [animation setSubtype:kCATransitionFromRight];
        [animation setDuration:5];
        [animation setTimingFunction:
         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [_imagVw.layer addAnimation:animation forKey:kCATransition];
        _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count]];
        count ++;
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe
{
    if(swipe.direction == UISwipeGestureRecognizerDirectionUp || swipe.direction == UISwipeGestureRecognizerDirectionDown)
    {
        
    }
    else if (swipe.direction == UISwipeGestureRecognizerDirectionLeft || swipe.direction == UISwipeGestureRecognizerDirectionRight)
    {
        if (swipe.direction == UISwipeGestureRecognizerDirectionLeft)
        {
            if (count < arrayForImages.count - 1)
            {
                count++;
                CATransition *animation = [CATransition animation];
                [animation setDelegate:self];
                [animation setType:kCATransitionFade];
                [animation setSubtype:kCATransitionFromRight];
                [animation setDuration:2.0];
                [animation setTimingFunction:
                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count]];
                [_imagVw.layer addAnimation:animation forKey:kCATransition];
            }
        }
        
        if (swipe.direction == UISwipeGestureRecognizerDirectionRight)
        {
            if (count >= 0)
            {
                if (count>=arrayForImages.count)
                {
                    count = count -1;
                }
                 count--;
                 if (count < 0)
                 {
                     count =0;
                 }
                else
                {
                CATransition *animation = [CATransition animation];
                [animation setDelegate:self];
                [animation setType:kCATransitionFade];
                [animation setSubtype:kCATransitionFromLeft];
                [animation setDuration:2.0];
                [animation setTimingFunction:
                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count]];
                [_imagVw.layer addAnimation:animation forKey:kCATransition];
                }
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSlideValue:(UISlider *)sender
{
    
    
    count = (int)roundf(sender.value) * 1;
    
    if (previousValue != count)
    {
//        NSLog(@"%i",(int)roundf(sender.value) * 1);
        previousValue = count;
        CATransition *animation = [CATransition animation];
        [animation setDelegate:self];
        [animation setType:kCATransitionFade];
        [animation setSubtype:kCATransitionFromLeft];
        [animation setDuration:1.0];
        [animation setTimingFunction:
         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count-1]];
        [_imagVw.layer addAnimation:animation forKey:kCATransition];
        
    }
    else if(count == 5)
    {
        _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count-1]];
    }
    
  
    
    
    
    
//    [UIView transitionWithView:_imagVw
//                      duration:10
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        _imagVw.image=[UIImage imageNamed:[arrayForImages objectAtIndex:count-1]];
//                    } completion:nil];
}
@end
