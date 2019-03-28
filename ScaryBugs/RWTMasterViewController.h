//
//  RWTMasterViewController.h
//  ScaryBugs
//
//  Created by Jorge Jordán Arenas on 04/02/14.
//
// https://www.raywenderlich.com/3114-ios-tutorial-how-to-create-a-simple-iphone-app-part-1-3

#import <UIKit/UIKit.h>
#import <VungleSDK/VungleSDK.h>

@interface RWTMasterViewController : UITableViewController<VungleSDKDelegate>

@property (strong) NSMutableArray *bugs;

@end
