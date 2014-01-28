//
//  MainViewController.h
//  calc
//
//  Created by KATSUHIKO on 2014/01/26.
//  Copyright (c) 2014年 KATSUHIKO. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>{
    //入力内容を入れておく変数ですよ
    NSMutableString *inputNumber;
    //四則ボタンのどれを押したか情報を入れておく変数
    
    //小数点を押したかフラグ
    BOOL dotFlag;
    //キータップ回数
    NSInteger counter;
}

@end
