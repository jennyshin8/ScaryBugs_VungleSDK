//
//  RWTDetailViewController.m
//  ScaryBugs
//
//  Created by Jorge Jordán Arenas on 04/02/14.
//
// https://www.raywenderlich.com/3114-ios-tutorial-how-to-create-a-simple-iphone-app-part-1-3

#import "RWTDetailViewController.h"

static NSString *const kVungleTestAppID = @"58fe200484fbd5b9670000e3";
static NSString *const kVungleTestPlacementID01 = @"PLMT01-41570";

@interface RWTDetailViewController ()
- (void)configureView;
@property (nonatomic, strong) VungleSDK *sdk;
@end

@implementation RWTDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    [self startVungle];
    NSLog(@"-->> Play an ad for %@", kVungleTestPlacementID01);
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        [self showAdForPlacement01];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***************************************************************/
- (void)startVungle {
    self.sdk = [VungleSDK sharedSDK];
    [self.sdk setDelegate:self];
    [self.sdk setLoggingEnabled:YES];
    NSError *error = nil;
    
    if(![self.sdk startWithAppId:kVungleTestAppID error:&error]) {
        NSLog(@"Error while starting VungleSDK %@", [error localizedDescription]);
        return;
    }
}


- (IBAction)showAdForPlacement01 {
    
    // Play a Vungle ad (with ordinal)
    NSError *error;
    
    [self.sdk playAd:self options:@{VunglePlayAdOptionKeyOrdinal: @11} placementID:kVungleTestPlacementID01 error:&error];
    
    if (error) {
        NSLog(@"Error encountered playing ad: %@", error);
    }
}

- (void)vungleAdPlayabilityUpdate:(BOOL)isAdPlayable placementID:(NSString *)placementID error:(NSError *)error {
    if (isAdPlayable) {
        NSLog(@"-->> Delegate Callback: vungleAdPlayabilityUpdate: Ad is available for Placement ID: %@", placementID);
    } else {
        NSLog(@"-->> Delegate Callback: vungleAdPlayabilityUpdate: Ad is NOT available for Placement ID: %@", placementID);
    }
}

- (void)vungleSDKDidInitialize {
    NSLog(@"-->> Delegate Callback: vungleSDKDidInitialize - SDK initialized SUCCESSFULLY");
    [self showAdForPlacement01];
}

@end
