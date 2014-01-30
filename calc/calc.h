//
//  calc.h
//  calc
//
//  Created by a19macbook1 on 2014/01/30.
//  Copyright (c) 2014年 KATSUHIKO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calc : NSObject{
    double result;
}

- (double)calcResult:(double)number1 n2:(double)number2 seed:(NSInteger)mySeed;

@end
