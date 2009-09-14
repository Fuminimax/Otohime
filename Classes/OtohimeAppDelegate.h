//
//  OtohimeAppDelegate.h
//  Otohime
//
//  Created by 高山 文夫 on 09/08/18.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface OtohimeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *viewController;

@end

