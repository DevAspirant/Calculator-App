//
//  CalculatorBrain.h
//  Calculator_FirstApp_20110117
//
//  Created by ammar falmban on 6/12/13.
//  Copyright (c) 2013 iCSTH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;

-(double)performOperation:(NSString *)operation;

@end
