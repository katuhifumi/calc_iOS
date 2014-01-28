//
//  MainViewController.m
//  calc
//
//  Created by KATSUHIKO on 2014/01/26.
//  Copyright (c) 2014年 KATSUHIKO. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
- (IBAction)numberTap:(UIButton *)sender;
- (IBAction)fourTap:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *plusTap;
@property (weak, nonatomic) IBOutlet UIButton *minusTap;
@property (weak, nonatomic) IBOutlet UIButton *timesTap;
@property (weak, nonatomic) IBOutlet UIButton *devidesTap;

- (IBAction)clearButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;


@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    inputNumber =  [NSMutableString	string];
    
    //小数点フラグ初期化
    dotFlag = NO;
    
    //キータップカウンタ初期化
    counter = 0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//数字ボタンをタップした時の処理だよよ
- (IBAction)numberTap:(UIButton *)sender {
    
    NSString *select;
    
    switch (sender.tag) {
        case 0:
            select = @"0";
            break;
        case 1:
            select = @"1";
            break;
        case 2:
            select = @"2";
            break;
        case 3:
            select = @"3";
            break;
        case 4:
            select = @"4";
            break;
        case 5:
            select = @"5";
            break;
        case 6:
            select = @"6";
            break;
        case 7:
            select = @"7";
            break;
        case 8:
            select = @"8";
            break;
        case 9:
            select = @"9";
            break;
        case 10:
            select = @".";
            break;
            
        default:
            break;
    }

    //ラベルに文字を順番に出す
    if(!dotFlag || (![select isEqualToString:@"."]) ){
        
        [[_plusTap layer] setBorderWidth:0];
        [[_minusTap layer] setBorderWidth:0];
        [[_timesTap layer] setBorderWidth:0];
        [[_devidesTap layer] setBorderWidth:0];
        
        //もし初回タップが.だった時は頭に0を入れる
        if (counter == 0 && [select isEqualToString:@"."]) {
            [inputNumber appendString:@"0"];
            counter = 1;
        }
        
        //初回タップのときACをCにする
        [_clearButton setTitle:@"C" forState:UIControlStateNormal];

        if (counter < 9){
            //配列にタップしたナンバーを追加
            [inputNumber appendString:select];
            _outputLabel.text = inputNumber;
    
            //doubleで取り出す
            double test =[_outputLabel.text doubleValue];
            NSLog(@"ラベルのテキストをdoubleに変換；%f",test);
            //配列の中身
            NSLog(@"配列の中身：%@",inputNumber);
            
            //.の多重入力防止
            if ([select isEqualToString:@"."]) {
              dotFlag = YES;
            }

            counter++;
            NSLog(@"カウンタ：%d",counter);
        }

        //.は入力回数にカウントしない
        if([select isEqualToString:@"."]){
            counter--;
        }
    }
}


//四則計算ボタンを押したときの処理
- (IBAction)fourTap:(UIButton *)sender {
    NSString *select;

    [[_plusTap layer] setBorderWidth:0];
    [[_minusTap layer] setBorderWidth:0];
    [[_timesTap layer] setBorderWidth:0];
    [[_devidesTap layer] setBorderWidth:0];
    
    switch (sender.tag) {
        case 0:
            select = @"+";
            break;
        case 1:
            select = @"-";
            break;
        case 2:
            select = @"x";
            break;
        case 3:
            select = @"÷";
            break;
        default:
            break;
    }
    
    [[sender layer] setBorderWidth:2.0f];
    [[sender layer] setBorderColor:[UIColor blackColor].CGColor];
    
    NSLog(@"%@",select);
    
}




//クリアボタン処理
- (IBAction)clearButton:(id)sender {
    //全部初期化
    _outputLabel.text = @"0";
    [inputNumber setString:@""];
    counter = 0;
    dotFlag = NO;
    
    //CボタンのタイトルをCにする
    [_clearButton setTitle:@"AC" forState:UIControlStateNormal];
    
}



#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
