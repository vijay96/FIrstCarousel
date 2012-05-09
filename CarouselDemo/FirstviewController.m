//
//  FirstviewController.m
//  CarouselDemo
//
//  Created by Vijay Chavan on 05/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
 
#import "FirstviewController.h"
#import "iCarousel.h"
#import <sqlite3.h>
@interface FirstviewController ()

@end
static int width;


@implementation FirstviewController
@synthesize carousel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
            
        self.tabBarItem.title=@"Labels";
       
        
        labels=[[NSMutableArray alloc]initWithObjects:@"label1",@"label2",@"label3",@"label4",@"label5",@"label6",@"label7",@"label8",@"label9",@"label10", nil];
        
    }
    return self;
}


-(void)parsefile
{
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"xml"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:xmlFilePath];
    parser = [[NSXMLParser alloc]initWithData:data];
    parser.delegate = self;
    [parser setShouldResolveExternalEntities:YES];
    [parser parse];

    

}


- (void)parserDidStartDocument:(NSXMLParser *)parser;
{
  
    labels=[[NSMutableArray alloc]init];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
   
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
   strval=string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
 
    if([elementName isEqualToString:@"Name"])
    {
         
           [labels addObject:strval];
       
    }    
}


- (void)parserDidEndDocument:(NSXMLParser *)parser
{

  
    for(NSString *str in labels)
    {
            
    }

}





- (void)viewDidLoad
{

    placeholderLabel.text=[NSString stringWithFormat:@"%.0f",placeholderCount.value];
    okButtonRef.hidden=TRUE;
    [super viewDidLoad];
    ScrollLabel.text=@"";
    addText.hidden=TRUE;
    addLabel.hidden=TRUE;


    countText.text=[NSString stringWithFormat:@"%.0f",sliderCount.value];
    width=[countText.text intValue];
    [carousel setUp];
    
}

- (void)viewDidUnload
{
    [self setCarousel:nil];
    sliderCount = nil;
    countText = nil;
    radiusCount = nil;
    
    placeholderLabel = nil;
    placeholderCount = nil;
    angleCount = nil;

    addText = nil;
    addLabel = nil;
    ScrollCount = nil;
    ScrollLabel = nil;
    okButtonRef = nil;
    [super viewDidUnload];
   
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}




- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{


    return [labels count];

}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return sliderCount.value;
    
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(40,50,300,100)];
    UILabel *label=[[UILabel alloc]initWithFrame:view.bounds];
    
    label.text=[labels objectAtIndex:index];
    label.font=[label.font fontWithSize:20];
    [view addSubview:label];
    return view;

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

    countText.text=[NSString stringWithFormat:@"%.0f",sliderCount.value];

      [carousel setUp];
        
}



- (CGFloat)carousel:(iCarousel *)carousel itemAlphaForOffset:(CGFloat)offset
{
    
    return 1.0f - fminf(fmaxf(offset, 0.0f), 1.0f);
}

- (IBAction)radiusSlider:(id)sender 
{
    [carousel setUp];
}

- (IBAction)placeholderSlider:(id)sender 
{
    placeholderLabel.text=[NSString stringWithFormat:@"%.0f",placeholderCount.value];
    [carousel setUp];
}

- (IBAction)okButton:(id)sender 
{
 
   
        if(![addText.text isEqualToString:@""])
        {
            NSInteger index = MAX(0, carousel.currentItemIndex);
            [labels insertObject:addText.text atIndex:index];
            [carousel insertItemAtIndex:index animated:YES];
            addText.text=@"";
            addText.hidden=TRUE;
            okButtonRef.hidden=true;
            
        }
        
        else 
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter the Text" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
            [alert show];
            
        }
        
        
    
    
    
  
    

}

- (IBAction)angleSlider:(id)sender 
{
    [carousel setUp];
}

- (CGFloat)srollSpeed:(iCarousel *)carousel
{
    return ScrollCount.value*50;
}

- (IBAction)addButton:(id)sender 
{
    okButtonRef.hidden=false;
    addLabel.hidden=FALSE;
    addText.hidden=FALSE;
    addText.spellCheckingType=UITextSpellCheckingTypeDefault;
      
    
  
    
}           

- (IBAction)ScrollSlider:(id)sender 
{
    ScrollLabel.text=[NSString stringWithFormat:@"%.0f",ScrollCount.value];
    [carousel setUp];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  if(textField==addText)
  {
      [addText resignFirstResponder];
  }
    return TRUE;
}

@end
