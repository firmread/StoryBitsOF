//
//  loginPage.cpp
//  loginPage
//
//  Created by Firm Read on 5/7/14.
//
//

#include "loginPage.h"
#include "ofxiOSExtras.h"
#include "ofApp.h"

@implementation loginPage

ofApp * myApp;


-(void)viewDidLoad {
    myApp = (ofApp*)ofGetAppPtr();
}


- (IBAction)loginTextField:(id)sender {
    UITextField *loginText = sender;
    myApp->loginString = * new std::string([[loginText text] UTF8String]);
}


- (void)dealloc {
    [_loginTextField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLoginTextField:nil];
    [super viewDidUnload];
}
@end