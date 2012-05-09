//
//  SecondviewController.h
//  CarouselDemo
//
//  Created by Vijay Chavan on 17/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@interface SecondviewController : UIViewController
{
    
    IBOutlet UILabel *placeHolderLabel;
    IBOutlet UISlider *sliderCount;
    IBOutlet UISlider *angleCount;
    IBOutlet UISlider *radiusCount;
    IBOutlet UISlider *placeholderCount;
    NSArray *picture;
    IBOutlet UILabel *visibleLabel;
    IBOutlet UISlider *scrollCount;
    
    IBOutlet UIImageView *showImage;
    IBOutlet UIButton *imageButton;
}

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
- (IBAction)sliderValue:(id)sender;

- (IBAction)radiusSlider:(id)sender;
- (IBAction)scrollValue:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *scrollLabel;

- (IBAction)placeholderSlider:(id)sender;
- (IBAction)angleSlider:(id)sender;
- (IBAction)imageaButton:(id)sender;


@end
