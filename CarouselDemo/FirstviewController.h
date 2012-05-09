//
//  FirstviewController.h
//  CarouselDemo
//
//  Created by Vijay Chavan on 05/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import <sqlite3.h>
@interface FirstviewController : UIViewController<iCarouselDataSource,UITextFieldDelegate,NSXMLParserDelegate>
{
    NSMutableArray *picture;
    NSMutableArray *labels;
    IBOutlet UILabel *countText;
    IBOutlet UISlider *sliderCount;

    IBOutlet UISlider *radiusCount;

    IBOutlet UISlider *angleCount;
    iCarousel *car;

    IBOutlet UIButton *okButtonRef;
    IBOutlet UISlider *placeholderCount;
    IBOutlet UILabel *placeholderLabel;
    //UITabBarItem *firstBarItem;

    IBOutlet UILabel *addLabel;
    IBOutlet UITextField *addText;
    IBOutlet UISlider *ScrollCount;
    IBOutlet UILabel *ScrollLabel;
    NSXMLParser *parser;
    NSString *strval;
}

@property (strong, nonatomic) IBOutlet iCarousel *carousel;

- (IBAction)sliderValue:(id)sender;
- (IBAction)radiusSlider:(id)sender;
- (IBAction)placeholderSlider:(id)sender;
- (IBAction)okButton:(id)sender;

- (IBAction)angleSlider:(id)sender;
- (IBAction)addButton:(id)sender;
- (IBAction)ScrollSlider:(id)sender;





@end
