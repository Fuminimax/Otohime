//
//  MainViewController.m
//  Otohime
//
//  Created by 高山 文夫 on 09/08/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AVFoundation/AVAudioPlayer.h"
#import "MainViewController.h"
#import "AVFoundation/AVFoundation.h"



@implementation MainViewController

- (id)init{
	self = [super init];
	
	if(self != nil){
		//helloWorld = [[NSString alloc] initWithString:@"Hello World!"];
	}
		
	return self;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	
	// 親ビューを作成
	myView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	
	// 背景画像とボタン画像を読み込む
	UIImage *mainImage = [UIImage imageNamed:@"mainImage.png"];
	UIImage *playbutton = [UIImage imageNamed:@"play_button.png"];
	
	// 背景画像用のImageViewを画面いっぱいで作成
	CGRect imgRect = CGRectMake(0.0, 0.0, 320.0, 480.0);
	imgView = [[UIImageView alloc] initWithFrame:imgRect];
	
	// ボタン用のImageViewを作成
	CGRect buttonRect = CGRectMake(65.0, 220.0, 190.0, 40.0); 
	buttonView = [[UIImageView alloc] initWithFrame:buttonRect];
	
	// ボタンのImageViewに画像を貼付ける
	buttonView.image = playbutton;
	
	// 背景画像を先に貼付ける
	imgView.image = mainImage;
	
	// 背景画像のImageViewにボタンのImageViewをSubViewとして貼付ける
	[imgView addSubview:buttonView];
	
	// 親Viewに背景画像用のImageViewを貼付けて完成
	[myView addSubview:imgView];
	self.view = myView;
	
} 

// マルチタッチを有効にするかどうかのメソッド。
- (BOOL)isMultipleTouchEnabled{
	
	// このアプリではマルチタッチを無効にする
	return NO;
}

// 画面をタッチされたらこれが反応する
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch *touch = [touches anyObject];
	
	// タッチされた場所を検知する
	CGPoint location = [touch locationInView: self.view];
	double touch_x = location.x;
	double touch_y = location.y;
	
	// タッチされた座標を元に処理を行う
	if(touch_x > 65.0 && touch_x < 255.0 && touch_y > 220.0 && touch_y < 260.0){
		
		if(playedAudio != TRUE){
			NSString *path = [[NSBundle mainBundle] pathForResource:@"seseragi" ofType:@"mp3"];
			NSURL *url = [NSURL fileURLWithPath:path];
			audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
			audio.delegate = self;
			audio.currentTime = 1.5f;
			//audio.numberOfLoops = 2;
			playedAudio = TRUE;
			[audio play];
		}
	}
	
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
	playedAudio = FALSE;
}
 
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[myView release];
	[imgView release];
	[buttonView release];
	[audio release];
	//[playedAudio release];
    [super dealloc];
}


@end
