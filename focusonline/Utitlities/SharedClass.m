//
//  SharedObject.m
//  frog
//
//  Created by WinMyintAung on 2/10/13.
//  Copyright (c) 2013 WinMyintAung. All rights reserved.
//

#import "SharedClass.h"


#define ACTIVITY_INDICATOR 110

@implementation SharedClass


@synthesize alertDialog = _alertDialog;

static SharedClass* sharedObj = nil;

+ (SharedClass*)sharedInstance {
    @synchronized(self) {
        if (sharedObj == nil) {
            sharedObj = [[SharedClass alloc] init];
        }
    }
    return sharedObj;
}

- (id)init {
    self = [super init];
    if (self) {
        // -- do initialize
    }
    return self;
}


+ (void)showSingletonDialog:(NSString *)title message:(NSString *)message okButton:(BOOL)value withDelegate:(id)delegate
{
    if (sharedObj.alertDialog == nil)
    {
        sharedObj.alertDialog = [[UIAlertView alloc] init];
    }
    
    if (sharedObj.alertDialog.isVisible)
        return;
    
    sharedObj.alertDialog.title = title;
    sharedObj.alertDialog.message = message;
    sharedObj.alertDialog.delegate = delegate;
    if(value)
    {
        [sharedObj.alertDialog addButtonWithTitle:NSLocalizedString(@"OK_Text", nil)];
        [sharedObj.alertDialog setCancelButtonIndex:0];
    }
	[sharedObj.alertDialog show];
}



#pragma mark - Create Button methods

+ (UIButton *)createButtonWithSize:(CGSize)size title:(id)title  target:(id)target action:(SEL)action image:(NSString *)image
{
    
    UIImage *img = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, size.width, size.height)];
   // btn.frame = frame;
    //[btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:img forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 5.0f;
    return btn;
    
    
}
@end
