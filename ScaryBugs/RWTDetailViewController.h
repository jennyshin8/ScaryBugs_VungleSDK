//
//  RWTDetailViewController.h
//  ScaryBugs
//
//  Created by Jorge Jordán Arenas on 04/02/14.
//
// https://www.raywenderlich.com/3114-ios-tutorial-how-to-create-a-simple-iphone-app-part-1-3

#import <UIKit/UIKit.h>
#import <VungleSDK/VungleSDK.h>

@interface RWTDetailViewController : UIViewController<VungleSDKDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
