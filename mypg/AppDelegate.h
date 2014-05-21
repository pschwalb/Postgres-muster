//
//  AppDelegate.h
//  mypg
//
//  Created by Peter Schwalb on 03.01.14.
//  Copyright (c) 2014 Peter Schwalb. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PGVIController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    __weak NSTextField *ego;
       
}

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *_ego;
@end
