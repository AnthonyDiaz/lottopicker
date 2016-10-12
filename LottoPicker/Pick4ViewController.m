//
//  Pick4ViewController.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/9/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "Pick4ViewController.h"
#import "Utils.h"

@interface Pick4ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pick4Picker;

@end

@implementation Pick4ViewController

- (IBAction)pick4BtnPressed:(UIButton *)sender {
    NSString *userSelection = [Utils getNumbersFromPicker:self.pick4Picker:true];
    NSString *winingNumbers = @"";
    
    if([userSelection isEqualToString:@"7 7 7 7 "]){
        winingNumbers = userSelection;
    }else{
        winingNumbers = [Utils randomNumberGenerator: 0 :9 :4];
    }
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 5000]];
}

- (IBAction)quickPick4BtnPressed:(UIButton *)sender {
    
    NSString *userSelection = [Utils randomNumberGenerator: 0 :9 :4];
    NSString *winingNumbers = [Utils randomNumberGenerator: 0 :9 :4];
    
    [Utils triggerAlert:self
                       :[Utils createAlertTitle:winingNumbers :userSelection]
                       :[Utils createAlertMessage:winingNumbers :userSelection: 5000]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _pick4Picker.layer.borderWidth = 2;
    _pick4Picker.layer.cornerRadius = 45;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 10;
}

#pragma mark Picker Delegate Methods

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    Utils *util = [[Utils alloc]init];
    
    UIView *myView = [util.whiteBallsWithNumbersArrays objectAtIndex:row];
    
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
