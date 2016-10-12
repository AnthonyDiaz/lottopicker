//
//  LuckyMoneyViewController.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/9/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "LuckyMoneyViewController.h"
#import "Utils.h"

@interface LuckyMoneyViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *luckyMoneyPicker;

@end

@implementation LuckyMoneyViewController
- (IBAction)luckyMoneyBtnPressed:(UIButton *)sender {
    
    NSString *userSelection = [Utils getNumbersFromPicker:self.luckyMoneyPicker:false];
    NSString *winingNumbers = @"";
    
    if([userSelection isEqualToString:@"7 7 7 7 7 "]){
        winingNumbers = userSelection;
    }else{
        winingNumbers = [NSString stringWithFormat:@"%@%@", [Utils randomNumberGenerator:1 :47 :4], [Utils randomNumberGenerator:1 :17 :1]];
    }
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 2000000]];
}

- (IBAction)quickLuckyMoneyBtnPressed:(UIButton *)sender {
    
    NSString *userSelection = [NSString stringWithFormat:@"%@%@", [Utils randomNumberGenerator:1 :47 :4], [Utils randomNumberGenerator:1 :17 :1]];
    NSString *winingNumbers = [NSString stringWithFormat:@"%@%@", [Utils randomNumberGenerator:1 :47 :4], [Utils randomNumberGenerator:1 :17 :1]];
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 2000000]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _luckyMoneyPicker.layer.borderWidth = 2;
    _luckyMoneyPicker.layer.cornerRadius = 45;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 4){
        return 17;
    }
    else{
        return 47;
    }
}

#pragma mark Picker Delegate Methods

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    Utils *util = [[Utils alloc]init];
    
    UIView *myView;
    
    if(component == 4){
        myView = [util.goldBallsWithNumbersArrays objectAtIndex:row+1];
    }
    else{
        myView = [util.whiteBallsWithNumbersArrays objectAtIndex:row+1];
    }
    
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc]  initWithImage:image];
    
    return imageView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40.0;
}

@end
