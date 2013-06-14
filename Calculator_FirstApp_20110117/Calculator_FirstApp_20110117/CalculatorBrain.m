//
//  CalculatorBrain.m
//  Calculator_FirstApp_20110117
//
//  Created by ammar falmban on 6/12/13.
//  Copyright (c) 2013 iCSTH. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

@property(nonatomic,strong)NSMutableArray *operandStack;

@end

@implementation CalculatorBrain

// @synthesize : is making the getter and setter .

@synthesize operandStack = _operandStack;

// That is the getter

-(NSMutableArray *)operandStack{
    
    if(!_operandStack){
        
        _operandStack = [[NSMutableArray alloc]init];
        
    }
    
    return _operandStack;
    
}

// That is the setter

-(void)setOperandStack:(NSMutableArray *)anArray{
    
    _operandStack = anArray;
    
}

/* it,s take a number as object */

-(double)popOperand{
    
    NSNumber *operandObject = [self.operandStack lastObject];
    
    if(operandObject) [self.operandStack removeLastObject];
    
    return [operandObject doubleValue];
    
}

-(void)pushOperand:(double)operand{
    
    // NSNumber : which can be used to wrap primitive types into an object.
    
       NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    
       [self.operandStack addObject:operandObject];
    
    
    
    
}

 //  That method for make the operation (+,-,+,/)

-(double)performOperation:(NSString *)operation{
    
    double result = 0;
    
    if([operation isEqualToString:@"+"]){
    
      result = [self popOperand] + [self popOperand];
    
    } else if ([@"*" isEqualToString:operation]){
        
      result = [self popOperand] * [self popOperand];
    
    } else if ([operation isEqualToString:@"-"]){
        
      double subtrahend = [self popOperand];
        
      result = [self popOperand] - subtrahend;
        
    } else if ([operation isEqualToString:@"/"]){
        
      double divisor = [self popOperand];
        
      if(divisor) result = [self popOperand] / divisor;
    }
    
    [ self pushOperand:result];
    
    // Perform the operation here , store the answer in result
    
    return result;
    
}


@end
