//
//  ViewController.m
//  SignUp
//
//  Created by Suresh on 2/22/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()
@property(strong,nonatomic)NSManagedObject *nameObject;

@end

@implementation ViewController{
    NSMutableArray *resultArray;
    NSManagedObject *obj2;
    NSIndexPath *indexPath;
    BOOL find;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //find = NO;

  
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSManagedObjectContext *) getContext{
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.persistentContainer.viewContext;
    return context;
    
}

//-(void)fetchData{
//    NSManagedObjectContext *context = [self getContext];
//    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"SignUpDetails"];
//    
//    resultArray = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:request error:nil]];
//    
//    
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SignIn:(id)sender {
    if (self.firstName.text.length && self.password.text.length > 0) {
    
    
        NSManagedObjectContext *context = [self getContext];
        NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"SignUpDetails"];

        resultArray = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:request error:nil]];
  for (int i = 0; i<resultArray.count; i++) {
        NSManagedObject *obj = resultArray[i];
        
        if ([self.firstName.text isEqualToString:[obj valueForKey:@"firstname"]] && [self.password.text isEqualToString:[obj valueForKey:@"password"]]) {
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"SignInView"];
            [self presentViewController:vc animated:YES completion:nil];
            find = YES;
            
        
        }else{
            find = NO;
        }
  }
    
    }
    if (find == NO){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Details" message:@"Wrong Details" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }

    
}
@end
