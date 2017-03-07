//
//  SignUpViewController.h
//  SignUp
//
//  Created by Suresh on 2/22/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
- (IBAction)Submit:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *firstName;

@property (strong, nonatomic) IBOutlet UITextField *lastName;

@property (strong, nonatomic) IBOutlet UITextField *emailId;

@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UITextField *retypePassword;


@end
