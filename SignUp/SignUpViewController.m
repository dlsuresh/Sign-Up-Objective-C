//
//  SignUpViewController.m
//  SignUp
//
//  Created by Suresh on 2/22/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSManagedObjectContext*)getContext{
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    return context;
}


- (IBAction)Submit:(id)sender {
    
    if ((self.firstName.text.length && self.lastName.text.length && self.emailId.text.length && self.password.text.length && self.retypePassword.text.length) >0 ) {
     
        NSManagedObjectContext *context = [self getContext];
        
        NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:@"SignUpDetails" inManagedObjectContext:context];
        [obj setValue:self.firstName.text forKey:@"firstname"];
        [obj setValue:self.lastName.text forKey:@"lastname"];
        [obj setValue:self.emailId.text forKey:@"email"];
        if ([self.password.text isEqualToString:self.retypePassword.text]) {
            [obj setValue:self.password.text forKey:@"password"];
            if([context save:nil]){
            
            
            NSLog(@"Details has been saved");
            self.firstName.text = self.lastName.text = self.emailId.text = self.password.text = self.retypePassword.text = @"";
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"details" message:@"Details saved Successfully" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];

            }else{
                NSLog(@"Data not Saved");
            }
        }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Password" message:@"password not match" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        }
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"details" message:@"Fill textFields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
   

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
