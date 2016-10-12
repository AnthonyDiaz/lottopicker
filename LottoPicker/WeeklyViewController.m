//
//  WeeklyViewController.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/9/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "WeeklyViewController.h"

@interface WeeklyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UILabel *weeklyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *weeklyGamesPicker;
@property (strong, nonatomic)NSArray *weeklyGamesArray;
@property NSArray *gameIconsArray;

@end

@implementation WeeklyViewController

- (IBAction)selectedBtnPressed:(UIButton *)sender {
    
    switch ([self.weeklyGamesPicker selectedRowInComponent:0]) {
        case 0:
            [self performSegueWithIdentifier:@"weeklyToLuckyMoney" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"weeklyToFloridaLotto" sender:self];
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _weeklyGamesPicker.layer.borderWidth = 2;
    _weeklyGamesPicker.layer.cornerRadius = 45;
    
    //Initialize Data
    self.weeklyGamesArray = @[@"Lucky Money",
                              @"Florida Lotto"];
    
    // Connect data
    self.weeklyGamesPicker.dataSource = self;
    self.weeklyGamesPicker.delegate = self;
    
    self.gameIconsArray = [[NSArray alloc]initWithObjects:
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"luckyMoney.png"]],
                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"floridaLotto.png"]],nil];
    
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

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return  130.0;
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
    return [self.weeklyGamesArray count];
}

#pragma mark Picker Delegate Methods
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.weeklyGamesArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //Change SelectBtn Text
    [self.selectBtn setTitle:[NSString stringWithFormat:@"Select %@", [self.weeklyGamesArray objectAtIndex:row]] forState:UIControlStateNormal];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
