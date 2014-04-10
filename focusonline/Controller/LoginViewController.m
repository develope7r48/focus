//
//  LoginViewController.m
//  iExamStudent
//
//  Created by Thein Tun Aung on 19/1/13.
//  Copyright (c) 2013 Thein Tun Aung. All rights reserved.
//

#import "LoginViewController.h"
#import "Configuration.h"
#import "SharedClass.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
//@synthesize myController;

- (id)init
{
    self = [super init];
    if (self) {
        
        // Custom initialization
        
    }
    return self;
}

-(void) initLabelsTextfields
{
  
    registrationCodeBtn = [SharedClass createButtonWithSize:CGSizeMake(300, 80)  title:@"" target:self action:@selector(clickedRegCodBtn:) image:@""];
    CGRect frame = registrationCodeBtn.frame;
    frame.origin.x = 30;
    frame.origin.y = 100;
    [self.view addSubview:registrationCodeBtn];
//  
//    self.alertBtn = [[SharedClass sharedInstance] createButtonWithSize:CGSizeMake(WIDTH_OF(alertView) - ORIGIN_X_AFTER(calendarIcon, 10), 80) title:@"" target:self action:@selector(openAlertDetail:)];
//    frame = alertBtn.frame;
//    frame.origin.x = ORIGIN_X_AFTER(calendarIcon, 10);
//    frame.origin.y = 30;
//    alertBtn.frame = frame;
//    alertBtn.enabled = NO;
}



#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    NSLog(@"Load Help.");
    viewFrame = [[UIScreen mainScreen] bounds];
    UIView *myView = [[UIView alloc] initWithFrame:viewFrame];
    
    UIImage* myImage;
    if ( IS_IPAD )
    {
        myImage = [UIImage imageNamed:@"ipadbackground.png"];
	}
    else
    {
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
            myImage = [UIImage imageNamed:@"background.png"];
            
        } else {
            myImage = [UIImage imageNamed:@"iphone4_4s_background.png"];
            
        }
    }
    myView.backgroundColor = [UIColor colorWithPatternImage:myImage];
    self.view = myView;
    [self initLabelsTextfields];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}
#pragma mark - support methods

-(void) showErrorMessage:(NSString*) message
{
    UIAlertView * view;
    
    view = [[UIAlertView alloc] initWithTitle:@"Notice" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [view show];
 
}

- (void)clickedRegCodBtn:(id)sender
{

}

//-(void) submitButtonClicked:(id)sender
//{
//    [passwordField resignFirstResponder];
//    [usernameField resignFirstResponder];
//   
//    NSString	*userName=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"UserName"]];
//    NSLog(@"UserName %@",userName);
//    NSString	*passWord=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"PassWord"]];
//    NSLog(@"passWord %@",passWord);
//    
//    if ([userName isEqualToString:usernameField.text] && [passWord isEqualToString:passwordField.text])
//    {
//        [self loginWithSuccess];
//    }
//    
//    else {
//        [self showErrorMessage:@"Please Sing in User Name and Password" ];
//    }
//
//    
//}
//
//-(void)studentButtonClicked
//{
//    [[NSUserDefaults standardUserDefaults] setObject:@"Student" forKey:@"TeacherStudent"];
//    container.hidden = YES;
//    
//
//}
//
//-(void)teacherButtonClicked {
//    [[NSUserDefaults standardUserDefaults] setObject:@"Teacher" forKey:@"TeacherStudent"];
//    container.hidden = YES;
//
//}
//-(void) loginWithSuccess
//{
//   // [myController loginSuccessfulWithMessage:@"Login Successfully"];
//}



@end
