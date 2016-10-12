//
//  Utils.m
//  LottoPicker
//
//  Created by Raydel Mesa on 10/10/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import "Utils.h"

@interface Utils ()
@end

@implementation Utils

+(NSString*) randomNumberGenerator:(int) minValue: (int) maxValue:(int) amountOfNumbers{
    
      NSString *rdmNumbers = @"";
    
    for(int i = 0;  i < amountOfNumbers; i++ ){
        //generate random numbers from Min to Max
        rdmNumbers = [NSString stringWithFormat:@"%@%d ", rdmNumbers, (int)minValue + arc4random() % (maxValue-minValue+1)];
    }
    
    return rdmNumbers;
}

+(NSString*) getNumbersFromPicker: (UIPickerView*) picker : (Boolean) startsAtZero{
     NSString *numbers = @"";
    
    for(int i = 0; i < [picker numberOfComponents]; i++){
        if(startsAtZero){
            numbers = [NSString stringWithFormat:@"%@%ld ", numbers, [picker selectedRowInComponent:i]];
        }
        else{
            numbers = [NSString stringWithFormat:@"%@%ld ", numbers, [picker selectedRowInComponent:i]+1];
        }
    }
    
    return numbers;
}

+(void) triggerAlert: (UIViewController*) view:(NSString*) title :(NSString*) message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:
                                UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:
                                    UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [view presentViewController:alert animated:YES completion:nil];

}

+(NSString*) createAlertMessage:(NSString*) winingNumbers: (NSString*) userSelection: (NSInteger) amountWon{
    
    NSString* alertMessage = @"";
    
    if([winingNumbers isEqualToString:userSelection]){
        
        alertMessage = [NSString stringWithFormat:@"Winning Numbers: %@\nYou won $%ld", winingNumbers,(long)amountWon];
    }
    else{
        alertMessage = [NSString stringWithFormat:@"Winning Numbers: %@\nYour numbers: %@\n\nTicket Price: $1.00", winingNumbers, userSelection];
    }
    
    return alertMessage;
}

+(NSString*) createAlertTitle:(NSString*) winingNumbers: (NSString*) userSelection{
    NSString* alertTitle = @"";
    
    if([winingNumbers isEqualToString:userSelection]){
        
        alertTitle = [NSString stringWithFormat:@"You are a winner!!"];
    }
    else{
        alertTitle = [NSString stringWithFormat:@"Sorry try again"];
    }
    
    return alertTitle;
}

- (id)init {
    if (!(self = [super init]))
        return nil;
    
    self.whiteBallsWithNumbersArrays = [[NSArray alloc]initWithObjects:
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"7.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"8.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"10.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"11.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"13.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"14.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"15.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"16.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"17.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"18.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"19.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"20.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"21.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"22.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"23.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"24.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"25.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"26.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"27.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"28.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"29.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"30.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"31.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"32.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"33.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"34.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"35.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"36.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"38.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"39.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"40.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"41.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"42.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"43.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"44.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"45.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"46.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"48.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"49.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"50.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"51.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"52.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"53.png"]]
                                        ,nil];
    
    self.goldBallsWithNumbersArrays = [[NSArray alloc]initWithObjects:
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"7gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"8gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"10gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"11gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"13gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"14gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"15gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"16gold.png"]],
                                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"17gold.png"]],
                                        nil];
    return self;
}


- (void)viewDidLoad {
     [super viewDidLoad];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
