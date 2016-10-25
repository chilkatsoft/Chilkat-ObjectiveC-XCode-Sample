//
//  httpProgress.m
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "httpProgress.h"

@implementation httpProgress

// IMPORTANT: Callbacks from an async method call, such as DownloadAsync
// occur in a background thread.   

- (void)PercentDone: (NSNumber *)pctDone abort: (BOOL *)abort
{
    int percentDone = [pctDone intValue];
    NSLog(@"%@%d",@"Percent Done: ",percentDone);
}

- (void)ProgressInfo:(NSString *)pinfName value:(NSString *)pinfValue
{
    NSLog(@"%@%@%@",pinfName,@": ",pinfValue);
}

@end


