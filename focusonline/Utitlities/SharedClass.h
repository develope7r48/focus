//
//  SharedObject.h
//  frog
//
//  Created by WinMyintAung on 2/10/13.
//  Copyright (c) 2013 WinMyintAung. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <QuartzCore/CoreAnimation.h>
//#import "CustomTextField.h"

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>




@interface SharedClass : NSObject


@property (nonatomic, strong) UIAlertView *alertDialog;

+(SharedClass*)sharedInstance;




+ (UIButton *)createButtonWithSize:(CGSize)size title:(id)title  target:(id)target action:(SEL)action image:(NSString *)image;

+ (void)showSingletonDialog:(NSString *)title message:(NSString *)message okButton:(BOOL)value withDelegate:(id)delegate;




@end
