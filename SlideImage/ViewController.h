//
//  ViewController.h
//  SlideImage
//
//  Created by Intellisense Technology on 01/11/16.
//  Copyright © 2016 intellisense Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imagVw;
@property (strong, nonatomic) IBOutlet UISlider *slider;
- (IBAction)changeSlideValue:(UISlider *)sender;

@end

