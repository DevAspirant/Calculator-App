//
//  CalculatorViewController.m
//  Calculator_FirstApp_20110117
//
//  Created by ammar falmban on 6/12/13.
//  Copyright (c) 2013 iCSTH. All rights reserved.
//

#import "CalculatorViewController.h"

#import "CalculatorBrain.h"

/* For Solation the Leading Zero Problem we have
 
   First make a private properties */

@interface CalculatorViewController()

@property(nonatomic) BOOL userInTheMiddleOfEnteringANumber;

@property(nonatomic,strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;

@synthesize userInTheMiddleOfEnteringANumber = _userInTheMiddleOfEnteringANumber;

@synthesize brain = _brain;

/*  */
-(CalculatorBrain *)brain{
    
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    
    return _brain;
}

/* Make a method to when the user push the button */

- (IBAction)digitPressed:(UIButton *)sender {
   
   NSString *digit = [sender currentTitle];

    /* When the user pushed on the button  */
    
    if(self.userInTheMiddleOfEnteringANumber){

    /* The program will copy the string what the user pressed on the button  */
        
    self.display.text = [self.display.text stringByAppendingString:digit];
    
    /* And make that proceess  */
    
    }else{
        
    /* disply the digit on the display Label   */
        
    self.display.text = digit;
    
    /*  ?  */
        
    self.userInTheMiddleOfEnteringANumber = YES;
        
    }
    
    /* Display the number on the display Label */
}

/* Make a method For When the user push Enter  */

- (IBAction)enterPressed {

    [self.brain pushOperand:[self.display.text doubleValue]];
    
     self.userInTheMiddleOfEnteringANumber = NO;

}

/* Make a method For Operation like ( + , - , * , / ) */

- (IBAction)operationPressed:(id)sender {
    
    if(self.userInTheMiddleOfEnteringANumber){
        
        [self enterPressed];
        
    }
    
    NSString *operation = [sender currentTitle];
    
    double result = [self.brain performOperation:operation];

    self.display.text = [NSString stringWithFormat:@"%g",result];
    
    
}


@end
