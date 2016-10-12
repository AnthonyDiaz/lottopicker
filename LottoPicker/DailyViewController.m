//
//  ViewController.m
//  LottoPicker
//
//  Created by Joey Diaz on 10/7/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "DailyViewController.h"

@interface DailyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *dailyGamesPicker;
@property NSArray *gameIconsArray;
@end

@implementation DailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dailyGamesPicker.layer.cornerRadius = 45;
    _dailyGamesPicker.layer.borderWidth = 2;
    
    self.gameIconsArray = [[NSArray alloc]initWithObjects:
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick2icon.png"]],
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick3icon.png"]],
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick4icon.png"]],
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick5icon.png"]],
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fantasy5icon.png"]],nil];
}

- (IBAction)selectedBtnPressed:(UIButton *)sender {
    
    switch ([self.dailyGamesPicker selectedRowInComponent:0]) {
        case 0:
             [self performSegueWithIdentifier:@"dailyToPick2" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"dailyToPick3" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"dailyToPick4" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"dailyToPick5" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"dailyToFantasy5" sender:self];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIView *myView = [self.gameIconsArray objectAtIndex:row];
    
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc]  initWithImage:image];
    
    return imageView;
    
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.gameIconsArray count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return  55.0;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return  130.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *selGame = @"";
    
    switch (row) {
        case 0:
            selGame = @"Select Pick 2";
            break;
        case 1:
            selGame = @"Select Pick 3";
            break;
        case 2:
            selGame = @"Select Pick 4";
            break;
        case 3:
            selGame = @"Select Pick 5";
            break;
        case 4:
            selGame = @"Select Fantasy 5";
            break;
        default:
            break;
    }
    
    //Change SelectBtn Text
    [self.selectBtn setTitle:selGame forState:UIControlStateNormal];
}


@end
