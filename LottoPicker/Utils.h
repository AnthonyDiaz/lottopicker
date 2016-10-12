//
//  Utils.h
//  LottoPicker
//
//  Created by Raydel Mesa on 10/10/16.
//  Copyright © 2016 Joey Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : UIViewController
@property NSArray *whiteBallsWithNumbersArrays;
@property NSArray *goldBallsWithNumbersArrays;

//Default Constructor initialize the array of images
- (id)init;

//Create an specif amount of random numbers
//Param:
//  minValue
//  maxValue
//  amountOfNumbers
//return a NSString with random numbers separate by " "
+(NSString*) randomNumberGenerator:(int) minValue: (int) maxValue:(int) amountOfNumbers;

//Get all numbers from picker
//Param:
//  UIPickerView
//  Boolean startsAtZero: whether the picker start at 0 or 1
//return a NSString with all numbers from picker separate by " "
+(NSString*) getNumbersFromPicker: (UIPickerView*) picker: (Boolean) startsAtZero;

//Trigger alert
//*****This method triggers the Alert for of all games *****
//Param:
//  UIViewController
//  alert title
//  alert message
//void
+(void) triggerAlert: (UIViewController*) view:(NSString*) title :(NSString*) message;

//Create Alert Message
//*****This method have the Alert Message of all games *****
//Param:
//  winingNumbers
//  user selected numbers
//  amount won by user if any
//return Alert Message: NSString
+(NSString*) createAlertMessage:(NSString*) winingNumbers: (NSString*) userSelection: (NSInteger) amountWon;

//Create Alert Title
//*****This method have the Alert Title of all games *****
//Param:
//  winingNumbers
//  user selected numbers
//return Alert Title: NSString
+(NSString*) createAlertTitle:(NSString*) winingNumbers: (NSString*) userSelection;
@end
