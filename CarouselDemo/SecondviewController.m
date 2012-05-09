//
//  SecondviewController.m
//  CarouselDemo
//
//  Created by Vijay Chavan on 17/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondviewController.h"
#import "ThirdViewController.h"
@interface SecondviewController ()

@end

@implementation SecondviewController
@synthesize scrollLabel;
@synthesize carousel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        picture=[[NSMutableArray alloc]initWithObjects:@"image_1.png",@"image_2.png",@"image_3.png",@"image_4.png",@"image_5.png",@"image_6.png",@"image_7.png",@"image_8.png",@"image_9.png",@"image_10.png", nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
 
    visibleLabel.text=[NSString stringWithFormat:@"%.0f",sliderCount.value];
     placeHolderLabel.text=[NSString stringWithFormat:@"%.0f",placeholderCount.value];
    scrollLabel.text=@"";
   


    [carousel setUp];
    [super viewDidLoad];


}

- (void)viewDidUnload
{
    sliderCount = nil;
    radiusCount = nil;
    angleCount = nil;
    placeholderCount = nil;
    [self setCarousel:nil];
    [self setCarousel:nil];
    [self setCarousel:nil];
    visibleLabel = nil;
    placeHolderLabel = nil;
    scrollCount = nil;
    [self setScrollLabel:nil];
    imageButton = nil;
    showImage = nil;
    [super viewDidUnload];

}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)aCarousel
{    
    
    showImage.image=[UIImage imageNamed:[picture objectAtIndex:carousel.currentItemIndex]];
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    
    
    return [picture count];
    
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return sliderCount.value;
    
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{

	UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[picture objectAtIndex:index]]];
    return view;

}



- (CGFloat)srollSpeed:(iCarousel *)carousel
{
    return scrollCount.value*10;
}


- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    
    return placeholderCount.value;
}

- (CGFloat)carouselAngle:(iCarousel *)carousel
{
    return angleCount.value;
}
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return radiusCount.value;
}



- (IBAction)sliderValue:(id)sender 
{
        visibleLabel.text=[NSString stringWithFormat:@"%.0f",sliderCount.value];
        [carousel setUp];
}

- (IBAction)radiusSlider:(id)sender 
{
      [carousel setUp];
}

- (IBAction)scrollValue:(id)sender 
{
    

        scrollLabel.text=[NSString stringWithFormat:@"%.0f",scrollCount.value];
        [carousel setUp];
    
}

- (IBAction)placeholderSlider:(id)sender 
{
    placeHolderLabel.text=[NSString stringWithFormat:@"%.0f",placeholderCount.value];
      [carousel setUp];
}

- (IBAction)angleSlider:(id)sender 
{
      [carousel setUp];
}

- (IBAction)imageaButton:(id)sender 
{
    ThirdViewController *controller=[[ThirdViewController alloc]initWithImage:[picture objectAtIndex:carousel.currentItemIndex]];
    controller.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    [self presentModalViewController:controller animated:YES];
}





@end
