//
//  calc.m
//  calc
//
//  Created by a19macbook1 on 2014/01/30.
//  Copyright (c) 2014年 KATSUHIKO. All rights reserved.
//

#import "calc.h"

@implementation calc


//計算結果を返す
- (double)calcResult:(double)number1 n2:(double)number2 seed:(NSInteger)mySeed{
    if(mySeed==1){
        result = number1 + number2;
    }else if(mySeed==2){
        result = number1 - number2;
    }else if (mySeed==3){
        result = number1 * number2;
    }else if (mySeed==4){
        result = number1 / number2;
    }
    return result;
}


@end
