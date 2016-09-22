//
//  main.m
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL ftp_unlock();
void test_ftpUpload();
void test_ftpDownload();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        ftp_unlock();
        
        test_ftpUpload();
        
        //NSLog(@"Hello, World!");
    }
    return 0;
}
