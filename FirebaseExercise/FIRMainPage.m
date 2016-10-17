//
//  FIRMainPage.m
//  FirebaseExercise
//
//  Created by GIGIGUN on 17/10/2016.
//  Copyright © 2016 GIGIGUN. All rights reserved.
//

#import "FIRMainPage.h"
@import Firebase;
#import <GoogleSignIn/GoogleSignIn.h>

@interface FIRMainPage ()  <GIDSignInUIDelegate>
@property (strong, nonatomic) IBOutlet UIButton *SignOutBtn;
@property (strong, nonatomic) IBOutlet UIButton *SignInBtn;
@property(strong, nonatomic) IBOutlet GIDSignInButton *signInButton;
@end

@implementation FIRMainPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
    
    // [Casper] Use GIDSignInButton
    
//    _signInButton = [[GIDSignInButton alloc] initWithFrame:CGRectMake(0,0,230,48)];
//    _signInButton.style = kGIDSignInButtonStyleWide;
//    _signInButton.center = self.view.center;
//    
//    [self.view addSubview:_signInButton];
    
    // [Casper] Add notification observer to get signIn / signOut notify from appdelegate
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender {
    
}

// Implement these methods only if the GIDSignInUIDelegate is not a subclass of
// UIViewController.

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
//    [myActivityIndicator stopAnimating];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    // ...
    
    NSLog(@"userID = %@", user.userID);
    NSLog(@"idToken = %@", user.authentication.idToken);
    NSLog(@"name = %@", user.profile.name);
}



- (IBAction)SignInBtnClicked:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
}

- (IBAction)SignOutBtnClicked:(id)sender {
    
    [[GIDSignIn sharedInstance] signOut];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
