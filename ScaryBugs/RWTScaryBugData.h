//
//  RWTScaryBugData.h
//  ScaryBugs
//
//  Created by Jorge Jordán Arenas on 04/02/14.
//
// https://www.raywenderlich.com/3114-ios-tutorial-how-to-create-a-simple-iphone-app-part-1-3

#import <Foundation/Foundation.h>

@interface RWTScaryBugData : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
