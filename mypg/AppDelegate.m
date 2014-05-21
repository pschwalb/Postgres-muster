//
//  AppDelegate.m
//  mypg
//
//  Created by Peter Schwalb on 03.01.14.
//  Copyright (c) 2014 Peter Schwalb. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
     PGSQLConnection *connection = [[PGSQLConnection alloc] init];
     
     [connection setUserName:@"peter"];
     [connection setPassword:@"biltop"];
     [connection setServer:@"localhost"];
     [connection setPort:@"5430"];
     [connection setDatabaseName:@"SI"];
     
     if ([connection connect])
     {
         // insert a couple of records
         NSMutableString *insertCmd = [[NSMutableString alloc] init];
         [insertCmd appendString:@"Select * from account; "];
         [connection execCommand:insertCmd];
         
         
         PGSQLRecordset *rs = [connection open:insertCmd];
         
         NSString *sql = @"Commit;";
         BOOL result = [connection execCommand:sql];
        
         long ab = rs.recordCount;
         if (![rs isEOF])
         {
             [ego setStringValue: [[rs fieldByName:@"version"] asString]];
             //printf(@"@%1,",text);
            // [serverVersion setString:@"hallo"];
             //[_ego addItemWithObjectValue:ab ];
         }
         [connection close];
     }
     else {
            NSLog(@"Connection Error: %@", [connection lastError]);
            }
    //[rs close];

}

@end
