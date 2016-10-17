//
//  ViewController.m
//  FirebaseExercise
//
//  Created by GIGIGUN on 16/10/2016.
//  Copyright © 2016 GIGIGUN. All rights reserved.
//

#import "ViewController.h"
@import Firebase;
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController () <GIDSignInUIDelegate>
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
