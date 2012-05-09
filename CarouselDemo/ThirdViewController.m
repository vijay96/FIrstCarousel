//
//  ThirdViewController.m
//  CarouselDemo
//
//  Created by Vijay Chavan on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithImage:(NSString *)_imageName
{
    self = [super initWithNibName:@"ThirdViewController" bundle:Nil];
    if (self) 
    {
        imageName=_imageName;
    }
    return self;
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageView.image=[UIImage imageNamed:imageName];
}

- (void)viewDidUnload
{
    imageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)backButton:(id)sender 
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
