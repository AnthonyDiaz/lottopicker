//
//  Fantasy5ViewController.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/9/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "Fantasy5ViewController.h"
#import "Utils.h"

@interface Fantasy5ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *fantasy5Picker;

@end

@implementation Fantasy5ViewController
- (IBAction)fantasy5BtnPressed:(UIButton *)sender {
    NSString *userSelection = [Utils getNumbersFromPicker:self.fantasy5Picker:false];
    NSString *winingNumbers = @"";
    
    if([userSelection isEqualToString:@"7 7 7 7 7 "]){
        winingNumbers = userSelection;
    }else{
        winingNumbers = [Utils randomNumberGenerator: 1 :36 :5];
    }
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 200000]];}

- (IBAction)quickFantasy5BtnPressed:(UIButton *)sender {
    
    NSString *userSelection = [Utils randomNumberGenerator: 1 :36 :5];
    NSString *winingNumbers = [Utils randomNumberGenerator: 1 :36 :5];
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 200000]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _fantasy5Picker.layer.cornerRadius = 45;
    _fantasy5Picker.layer.borderWidth = 2;
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
    return 36;
}

#pragma mark Picker Delegate Methods

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    Utils *util = [[Utils alloc]init];
    
    UIView *myView = [util.whiteBallsWithNumbersArrays objectAtIndex:row+1];
    
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
