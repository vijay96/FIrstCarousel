//
//  ThirdViewController.h
//  CarouselDemo
//
//  Created by Vijay Chavan on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    
    IBOutlet UIImageView *imageView;
    NSString *imageName;
}
- (IBAction)backButton:(id)sender;
- (id)initWithImage:(NSString *)_imageName;
@end
