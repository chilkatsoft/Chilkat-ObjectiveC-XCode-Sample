//
//  main.m
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "chilkat/include/CkoGlobal.h"

void test_ftpUpload();
void test_ftpDownload();
void test_httpDownload();
void test_asyncHttpDownload();

BOOL global_unlock()
{
    CkoGlobal *glob = [[CkoGlobal alloc] init];
    
    //  Any string unlocks the component for the 1st 30-days.
    BOOL success = [glob UnlockBundle: @"Anything for 30-day trial"];
    if (success != YES) {
        NSLog(@"%@",glob.LastErrorText);
        return NO;
    }
    
    return YES;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        global_unlock();
        
        //test_ftpUpload();
        //test_httpDownload();
        test_asyncHttpDownload();

        //NSLog(@"Hello, World!");
    }
    return 0;
}
