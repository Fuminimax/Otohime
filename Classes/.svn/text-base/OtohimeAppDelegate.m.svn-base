//
//  OtohimeAppDelegate.m
//  Otohime
//
//  Created by 高山 文夫 on 09/08/18.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AVFoundation/AVAudioPlayer.h"
#import "OtohimeAppDelegate.h"
#import "MainViewController.h"


@implementation OtohimeAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	
	self.window = [[UIWindow alloc] initWithFrame:screenBounds];
	viewController = [[MainViewController alloc] init];
	
	[window addSubview:viewController.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[viewController release];
    [window release];
    [super dealloc];
}


@end
