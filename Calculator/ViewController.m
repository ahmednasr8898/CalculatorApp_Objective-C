//
//  ViewController.m
//  Calculator
//
//  Created by Ahmed Nasr on 17/01/2022.
//

#import "ViewController.h"

@interface ViewController (){
    float result;
    char op;
    NSMutableString *fNumStr;
    NSMutableString *sNumStr;
    NSMutableString *resultStr;
    NSMutableArray *arr;
    
    int counterOfOperation;
    
    int counterPlus;
    int counterSub;
    int counterMul;
    int counterDiv;
    
    int counterMakeOperation;
    
    NSMutableString *extraNum;
    
    NSUserDefaults *userDefaults;
    
    NSMutableString *newACString;
    
    BOOL checkIsAcActive;
    BOOL checkPlusSub;
}

@property (weak, nonatomic) IBOutlet UIView *countenerView;
@property (weak, nonatomic) IBOutlet UIButton *zeroBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UILabel *resLabel;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *sixBtn;
@property (weak, nonatomic) IBOutlet UIButton *sevenBtn;
@property (weak, nonatomic) IBOutlet UIButton *eightBtn;
@property (weak, nonatomic) IBOutlet UIButton *nineBtn;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UIButton *divBtn;
@property (weak, nonatomic) IBOutlet UIButton *equalBtn;
@property (weak, nonatomic) IBOutlet UIButton *mulBtn;
@property (weak, nonatomic) IBOutlet UIButton *acBtn;
@property (weak, nonatomic) IBOutlet UIButton *pulsSubBtn;
@property (weak, nonatomic) IBOutlet UIButton *reminderBtn;
@property (weak, nonatomic) IBOutlet UIButton *dotBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *darkLightSegment;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sNumStr = [NSMutableString new];
    fNumStr = [NSMutableString new];
    resultStr = [NSMutableString new];
    arr = [NSMutableArray new];
    
    counterOfOperation = 0;
    counterPlus = 0;
    counterSub = 0;
    counterDiv = 0;
    counterMul = 0;
    
    counterMakeOperation = 0;
    extraNum = [NSMutableString new];
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults integerForKey:@"Mode"] == 0){
        [self.darkLightSegment setSelectedSegmentIndex:0];
        self.darkLightSegment.backgroundColor = [UIColor colorWithRed:34/256.0 green:37/256.0 blue:46/256.0 alpha:1.0];
        [self setDarkModeDesign];
      
    }else if ([userDefaults integerForKey:@"Mode"] == 1){
        [self.darkLightSegment setSelectedSegmentIndex:1];
        self.darkLightSegment.backgroundColor = [UIColor colorWithRed:253/256.0 green:250/256.0 blue:246/256.0 alpha:1.0];
        [self setLightModeDesign];
    }else{
        [self setDarkModeDesign];
    }
    
    [self setUpDesign];
    
    newACString = [NSMutableString new];
    
    checkIsAcActive = false;
    checkPlusSub = false;
}

- (IBAction)didPressedDarkLight:(id)sender {
    
    switch (self.darkLightSegment.selectedSegmentIndex) {
        case 0:
            [userDefaults setInteger:0 forKey:@"Mode"];
            self.darkLightSegment.backgroundColor = [UIColor colorWithRed:34/256.0 green:37/256.0 blue:46/256.0 alpha:1.0];
            [self setDarkModeDesign];
            break;
        case 1:
            [userDefaults setInteger:1 forKey:@"Mode"];
            self.darkLightSegment.backgroundColor = [UIColor colorWithRed:253/256.0 green:250/256.0 blue:246/256.0 alpha:1.0];
            [self setLightModeDesign];
            break;
        default:
            break;
    }
}

-(void) setLightModeDesign{
    UIColor *countenerColor = [UIColor colorWithRed:253/256.0 green:250/256.0 blue:246/256.0 alpha:1.0];
    UIColor *buttonBackgroundColor = [UIColor colorWithRed:244/256.0 green:238/256.0 blue:237/256.0 alpha:1.0];
    UIColor *buttonTextColor = [UIColor colorWithRed:44/256.0 green:51/256.0 blue:51/256.0 alpha:1.0];
    UIColor *buttonTextColor2 = [UIColor colorWithRed:252/256.0 green:79/256.0 blue:79/256.0 alpha:1.0];
    UIColor *buttonTextColor3 = [UIColor colorWithRed:46/256.0 green:176/256.0 blue:134/256.0 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithRed:255/256.0 green:255/256.0 blue:255/256.0 alpha:1.0];
    
    self.countenerView.backgroundColor = countenerColor;
    self.view.backgroundColor = countenerColor;
    
    self.resLabel.backgroundColor = backgroundColor;
    self.resLabel.textColor = UIColor.blackColor;
    
    _zeroBtn.backgroundColor = buttonBackgroundColor;
    [_zeroBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _oneBtn.backgroundColor = buttonBackgroundColor;
    [_oneBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _twoBtn.backgroundColor = buttonBackgroundColor;
    [_twoBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _threeBtn.backgroundColor = buttonBackgroundColor;
    [_threeBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _fourBtn.backgroundColor = buttonBackgroundColor;
    [_fourBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _fiveBtn.backgroundColor = buttonBackgroundColor;
    [_fiveBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _sixBtn.backgroundColor = buttonBackgroundColor;
    [_sixBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _sevenBtn.backgroundColor = buttonBackgroundColor;
    [_sevenBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _eightBtn.backgroundColor = buttonBackgroundColor;
    [_eightBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _nineBtn.backgroundColor = buttonBackgroundColor;
    [_nineBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _zeroBtn.backgroundColor = buttonBackgroundColor;
    [_zeroBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _clearBtn.backgroundColor = buttonBackgroundColor;
    [_clearBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _dotBtn.backgroundColor = buttonBackgroundColor;
    [_dotBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _equalBtn.backgroundColor = buttonBackgroundColor;
    [_clearBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _plusBtn.backgroundColor = buttonBackgroundColor;
    [_plusBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _subBtn.backgroundColor = buttonBackgroundColor;
    [_subBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _divBtn.backgroundColor = buttonBackgroundColor;
    [_divBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _mulBtn.backgroundColor = buttonBackgroundColor;
    [_mulBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _acBtn.backgroundColor = buttonBackgroundColor;
    [_acBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];
    
    _reminderBtn.backgroundColor = buttonBackgroundColor;
    [_reminderBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];
    
    _pulsSubBtn.backgroundColor = buttonBackgroundColor;
    [_pulsSubBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];    
}

-(void) setDarkModeDesign{
    UIColor *countenerColor = [UIColor colorWithRed:34/256.0 green:37/256.0 blue:46/256.0 alpha:1.0];
    UIColor *buttonBackgroundColor = [UIColor colorWithRed:39/256.0 green:43/256.0 blue:52/256.0 alpha:1.0];
    UIColor *buttonTextColor = UIColor.systemBackgroundColor;
    UIColor *buttonTextColor2 = [UIColor colorWithRed:252/256.0 green:79/256.0 blue:79/256.0 alpha:1.0];
    UIColor *buttonTextColor3 = [UIColor colorWithRed:46/256.0 green:176/256.0 blue:134/256.0 alpha:1.0];
    UIColor *backgroundColor = [UIColor colorWithRed:7/256.0 green:5/256.0 blue:15/256.0 alpha:1];
    
    self.countenerView.backgroundColor = countenerColor;
    self.view.backgroundColor = backgroundColor;
    
    self.resLabel.backgroundColor = backgroundColor;
    self.resLabel.textColor = UIColor.whiteColor;
    
    _zeroBtn.backgroundColor = buttonBackgroundColor;
    [_zeroBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _oneBtn.backgroundColor = buttonBackgroundColor;
    [_oneBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _twoBtn.backgroundColor = buttonBackgroundColor;
    [_twoBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _threeBtn.backgroundColor = buttonBackgroundColor;
    [_threeBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _fourBtn.backgroundColor = buttonBackgroundColor;
    [_fourBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _fiveBtn.backgroundColor = buttonBackgroundColor;
    [_fiveBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _sixBtn.backgroundColor = buttonBackgroundColor;
    [_sixBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _sevenBtn.backgroundColor = buttonBackgroundColor;
    [_sevenBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _eightBtn.backgroundColor = buttonBackgroundColor;
    [_eightBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _nineBtn.backgroundColor = buttonBackgroundColor;
    [_nineBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
   
    _zeroBtn.backgroundColor = buttonBackgroundColor;
    [_zeroBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _clearBtn.backgroundColor = buttonBackgroundColor;
    [_clearBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _dotBtn.backgroundColor = buttonBackgroundColor;
    [_dotBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _equalBtn.backgroundColor = buttonBackgroundColor;
    [_clearBtn setTitleColor:buttonTextColor forState:UIControlStateNormal];
    
    _plusBtn.backgroundColor = buttonBackgroundColor;
    [_plusBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _subBtn.backgroundColor = buttonBackgroundColor;
    [_subBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _divBtn.backgroundColor = buttonBackgroundColor;
    [_divBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _mulBtn.backgroundColor = buttonBackgroundColor;
    [_mulBtn setTitleColor:buttonTextColor2 forState:UIControlStateNormal];
    
    _acBtn.backgroundColor = buttonBackgroundColor;
    [_acBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];
    
    _reminderBtn.backgroundColor = buttonBackgroundColor;
    [_reminderBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];
    
    _pulsSubBtn.backgroundColor = buttonBackgroundColor;
    [_pulsSubBtn setTitleColor:buttonTextColor3 forState:UIControlStateNormal];
}

-(void) setUpDesign{
    _countenerView.layer.cornerRadius = 20;
    _zeroBtn.layer.cornerRadius = 14;
    _oneBtn.layer.cornerRadius = 14;
    _twoBtn.layer.cornerRadius = 14;
    _threeBtn.layer.cornerRadius = 14;
    _fourBtn.layer.cornerRadius = 14;
    _fiveBtn.layer.cornerRadius = 14;
    _sixBtn.layer.cornerRadius = 14;
    _sevenBtn.layer.cornerRadius = 14;
    _eightBtn.layer.cornerRadius = 14;
    _nineBtn.layer.cornerRadius = 14;
    _plusBtn.layer.cornerRadius = 14;
    _subBtn.layer.cornerRadius = 14;
    _mulBtn.layer.cornerRadius = 14;
    _divBtn.layer.cornerRadius = 14;
    _clearBtn.layer.cornerRadius = 14;
    _equalBtn.layer.cornerRadius = 14;
    _nineBtn.layer.cornerRadius = 14;
    _reminderBtn.layer.cornerRadius = 14;
    _dotBtn.layer.cornerRadius = 14;
    _acBtn.layer.cornerRadius = 14;
    _pulsSubBtn.layer.cornerRadius = 14;
}

- (IBAction)btnOnClick:(id)sender {
    switch ([sender tag]) {
        case 10: // zero
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"0"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"0"];
            break;
        case 1: //1 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"1"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"1"];
            break;
        case 2: //2 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"2"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"2"];
            break;
        case 3: //3 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"3"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"3"];
            break;
        case 4: //4 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"4"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"4"];
            break;
        case 5: //5 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"5"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"5"];
            break;
        case 6: //6 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"6"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"6"];
            break;
        case 7: //7 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"7"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"7"];
            break;
        case 8: //8 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"8"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"8"];
            break;
        case 9: //9 number
            checkIsAcActive = false;
            checkPlusSub = false;
            [fNumStr appendString:@"9"];
            [_resLabel setText:fNumStr];
            [arr addObject:@"9"];
            break;
      
        case 11: // clear
            checkIsAcActive = false;
            checkPlusSub = false;
            [_resLabel setText:@""];
            [fNumStr setString:@""];
            [sNumStr setString:@""];
            counterMakeOperation = 0;
            counterOfOperation = 0;
            printf("clear\n");
            break;
            
        case 33: // + operator
            checkIsAcActive = true;
            checkPlusSub = false;
            if(counterMakeOperation == 0){
                counterMakeOperation++;
                if(counterOfOperation > 0){
                    printf("second time\n");
                    [fNumStr setString:@""];
                    [sNumStr setString:@""];
                    [sNumStr setString:_resLabel.text];
                    [arr addObject:@"+"];
                    op = '+';
                }else{
                    printf("first time\n");
                    [sNumStr setString:fNumStr];
                    [fNumStr setString:@""];
                    [arr addObject:@"+"];
                    op = '+';
                    printf("+ \n");
                }
            }else{
                printf("second22222 time\n");
                [self equlaOperation];
                [fNumStr setString:@""];
                [sNumStr setString:@""];
                [sNumStr setString:_resLabel.text];
                [arr addObject:@"+"];
                op = '+';
            }
            break;
            
        case 44: // - operator
            checkIsAcActive = true;
            checkPlusSub = false;
            if(counterMakeOperation == 0){
                counterMakeOperation++;
                if(counterOfOperation > 0){
                    [fNumStr setString:@""];
                    [sNumStr setString:@""];
                    [sNumStr setString:_resLabel.text];
                    [arr addObject:@"-"];
                    printf("fnum : %s", [fNumStr UTF8String]);
                    op = '-';
                }else{
                    [sNumStr setString:fNumStr];
                    [fNumStr setString:@""];
                    [arr addObject:@"-"];
                    op = '-';
                    printf("- \n");
                }
            }else{
                [self equlaOperation];
                [fNumStr setString:@""];
                [sNumStr setString:@""];
                [sNumStr setString:_resLabel.text];
                [arr addObject:@"-"];
                op = '-';
            }
            break;
            
        case 55: // * operator
            checkIsAcActive = true;
            checkPlusSub = false;
            if(counterMakeOperation == 0){
                counterMakeOperation++;
                if(counterOfOperation > 0){
                    [fNumStr setString:@""];
                    [sNumStr setString:@""];
                    [sNumStr setString:_resLabel.text];
                    [arr addObject:@"*"];
                    op = '*';
                }else{
                    [sNumStr setString:fNumStr];
                    [fNumStr setString:@""];
                    [arr addObject:@"*"];
                    op = '*';
                    printf("* \n");
                }
            }else{
                [self equlaOperation];
                [fNumStr setString:@""];
                [sNumStr setString:@""];
                [sNumStr setString:_resLabel.text];
                [arr addObject:@"*"];
                op = '*';
            }
            break;
            
        case 66: // / operator
            checkIsAcActive = true;
            checkPlusSub = false;
            printf("///// \n");
            if(counterMakeOperation == 0){
                counterMakeOperation++;
                if(counterOfOperation > 0){
                    [fNumStr setString:@""];
                    [sNumStr setString:@""];
                    [sNumStr setString:_resLabel.text];
                    [arr addObject:@"/"];
                    op = '/';
                }else{
                    [sNumStr setString:fNumStr];
                    [fNumStr setString:@""];
                    [arr addObject:@"/"];
                    op = '/';
                    printf("/ \n");
                }
            }else{
                [self equlaOperation];
                [fNumStr setString:@""];
                [sNumStr setString:@""];
                [sNumStr setString:_resLabel.text];
                [arr addObject:@"/"];
                op = '/';
            }
            break;
            
        case 22: // = operator
            checkIsAcActive = true;
            checkPlusSub = true;
            [self equlaOperation];
            break;
        default:
            break;
    }
}

- (IBAction)divBtnDidPressed:(id)sender {
    if(counterMakeOperation == 0){
        counterMakeOperation++;
        if(counterOfOperation > 0){
            [fNumStr setString:@""];
            [sNumStr setString:@""];
            [sNumStr setString:_resLabel.text];
            [arr addObject:@"/"];
            op = '/';
        }else{
            [sNumStr setString:fNumStr];
            [fNumStr setString:@""];
            [arr addObject:@"/"];
            op = '/';
            printf("/ \n");
        }
    }else{
        [self equlaOperation];
        [fNumStr setString:@""];
        [sNumStr setString:@""];
        [sNumStr setString:_resLabel.text];
        [arr addObject:@"/"];
        op = '/';
    }
}

- (IBAction)acBtnDidPressed:(id)sender {
    if(!checkIsAcActive){
        if (fNumStr.length != 0){
        [fNumStr setString:[fNumStr substringToIndex:[fNumStr length]-1]];
        _resLabel.text = fNumStr;
        }
        
     }
    else{
         [_resLabel setText:@""];
         [fNumStr setString:@""];
         [sNumStr setString:@""];
         counterMakeOperation = 0;
         counterOfOperation = 0;
     }
}
- (IBAction)dotBtnDidPressed:(id)sender {
    [fNumStr appendString:@"."];
    [_resLabel setText:fNumStr];
}
- (IBAction)plusSubBtnDidPressed:(id)sender {
   
    
    if(!checkPlusSub){
        printf("case three");
        if(fNumStr.length != 0){
            printf("case one\n");
            [fNumStr setString:[@"-" stringByAppendingString:fNumStr]];
            _resLabel.text = fNumStr;
        }
        
     }
    else{
         printf("case two\n");
         [resultStr setString:[@"-" stringByAppendingString:resultStr]];
         [_resLabel setText:resultStr];
         
         result = - result;
        [fNumStr setString:@""];
        [sNumStr setString:@""];
        [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];
        [sNumStr setString:_resLabel.text];
     }
}
- (IBAction)reminderBtnDidPressed:(id)sender {
    printf("reminder\n");
    [_resLabel setText: [NSString stringWithFormat:@"%0.1f", [_resLabel.text floatValue]/100]] ;
    [fNumStr setString:_resLabel.text];
}

-(void) equlaOperation{
    counterOfOperation++;
    if(op == '+'){
        result = [fNumStr floatValue] + [sNumStr floatValue];
            [resultStr setString:[NSString stringWithFormat:@"%f", result]];
            NSLog(@"%@",resultStr);
            [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];
        
        
    }else if (op == '-'){
        //result = sNum - fNum;
        result = [sNumStr floatValue] - [fNumStr floatValue];
        [resultStr setString:[NSString stringWithFormat:@"%f", result]];
        [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];
        
    }else if (op == '*'){
        //result = fNum * sNum;
        result = [fNumStr floatValue] * [sNumStr floatValue];
        [resultStr setString:[NSString stringWithFormat:@"%f", result]];
        [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];
  
    }else if (op == '/'){
        //result = sNum / fNum;
        //handel diving by zero
        if([fNumStr intValue] == 0){
            [_resLabel setText:@"cannot be dividing by 0\n"];
        }else{
            result = [sNumStr floatValue] / [fNumStr floatValue];
            //handel if result is 4.0000 display 4 only
            if([sNumStr intValue] / [fNumStr intValue] %2 == 0){
                [resultStr setString:[NSString stringWithFormat:@"%f", result]];
                [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];

            }else{
                [resultStr setString:[NSString stringWithFormat:@"%f", result]];
                [_resLabel setText:[NSString stringWithFormat:@"%0.1f", result]];

            }
        }
    }
}
@end
