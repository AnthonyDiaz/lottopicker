//
//  IntroViewController.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/9/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "IntroViewController.h"
#import "DailyViewController.h"
#import "WeeklyViewController.h"

@interface IntroViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic)NSArray *introArray;
@property (strong, nonatomic) NSArray *introImagesArray;
@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerView.layer.borderWidth = 2;
    _pickerView.layer.cornerRadius = 45;
    
    //Initialize Data
    self.introArray = @[@"Daily",
                        @"Weekly"];
    
    // Connect data
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.introImagesArray = [[NSArray alloc]initWithObjects:
                                   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"daily.png"]],
                                   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"weekly.png"]],nil];

}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIView *myView = [self.introImagesArray objectAtIndex:row];
    
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc]  initWithImage:image];
    
    return imageView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return  60.0;
}


- (IBAction)selectBtnPressed:(UIButton *)sender {
    if ([self.pickerView selectedRowInComponent:0] == 0)
    {
        [self performSegueWithIdentifier:@"introToDaily" sender:self];
    }
    else
    {
         [self performSegueWithIdentifier:@"introToWeekly" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.introArray count];
}

#pragma mark Picker Delegate Methods
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.introArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //Change Select Btn Text
    
    [self.selectBtn setTitle:[NSString stringWithFormat:@"Select %@", [self.introArray objectAtIndex:row]] forState:UIControlStateNormal];
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
