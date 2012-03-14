//
//  ViewController.m
//  SimpleApp
//
//  Created by Ming Chow on 2/7/12.
//  Copyright (c) 2012 Tufts University. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize player, feedbackLabel, volumeLabel;

// IBAction is used to allow your methods to be associated with actions in IB
// Moar: http://stackoverflow.com/questions/1643007/iboutlet-and-ibaction

-(IBAction)buttonTriggered:(id)sender
{
    UIButton *theButton = (UIButton *)sender;
    NSLog(@"You pressed the button %@", theButton.currentTitle);
    if ([theButton.currentTitle isEqualToString:@"Hit Me 1!"]) {
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Button Pressed"
                                                      message:@"You sunk my battleship"
                                                     delegate:self
                                            cancelButtonTitle:@"Nice!"
                                            otherButtonTitles:nil,
                             nil];
        [view show];
    }
    else if ([theButton.currentTitle isEqualToString:@"Hit Me One More Time"]) {
        [feedbackLabel setText:@"Britney, is that you?"];
    }
    else if ([theButton.currentTitle isEqualToString:@"One Last Shot"]) {
        
        NSLog(@"Playing audio file...");
        if (player != nil) {
            [player play];
        }
        else {
            NSLog(@"Whoops, something is wrong with audio player!");
        }
    }
}

-(IBAction)sliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    NSString *volumeText = [NSString stringWithFormat:@"%f", slider.value];
    [volumeLabel setText:volumeText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSError *audioError;
    
    [super viewDidLoad];
    NSURL *urlPathOfAudio = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/krusty.mp3", [[NSBundle mainBundle] resourcePath]]];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPathOfAudio error:&audioError];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end