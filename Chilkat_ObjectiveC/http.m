//
//  http.m
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "httpProgress.h"
#import "chilkat/include/CkoHttp.h"
#import "chilkat/include/CkoTask.h"

void test_httpDownload()
{
	CkoHttp *http = [[CkoHttp alloc] init];
	httpProgress *http_progress = [[httpProgress alloc] init];
	[http setEventCallbackObject: http_progress];
    
	NSString *localFilePath = @"hamlet.xml";
	BOOL success = [http Download: @"https://www.chilkatsoft.com/hamlet.xml" saveToPath: localFilePath];
	if (success != YES) {
		NSLog(@"%@",http.LastErrorText);
		return;
	}
   
	NSLog(@"%@",@"File Downloaded!");
}


void test_asyncHttpDownload()
{
	CkoHttp *http = [[CkoHttp alloc] init];
	httpProgress *http_progress = [[httpProgress alloc] init];
	[http setEventCallbackObject: http_progress];
    
	NSString *localFilePath = @"php-7.0.12.tar.bz2";
	CkoTask *task = [http DownloadAsync: @"http://us2.php.net/get/php-7.0.12.tar.bz2/from/this/mirror" saveToPath: localFilePath];
	if (task == nil ) {
	    NSLog(@"%@",http.LastErrorText);
	    return;
	}

	//  Schedule the task for running on the thread pool.  This changes the task's state
	//  from Inert to Live.
	BOOL success = [task Run];
	if (success != YES) {
	    NSLog(@"%@",task.LastErrorText);
	    return;
	}

	//  For this example, we'll simply sleep and periodically
	//  check to see if the DownloadAsync if finished.
	while (task.Finished != YES) {
	    //  Sleep 100 ms.
	    [task SleepMs: [NSNumber numberWithInt: 100]];

	}

	//  A finished task could be one that was canceled, aborted, or truly finished.

	//  If the task was "canceled", it was canceled prior to actually starting.  This could
	//  happen if the task was canceled while waiting in a thread pool queue to be scheduled by Chilkat's
	//  background thread pool scheduler.

	//  If the task was "aborted", it indicates that it was canceled while running in a background thread.
	//  The ResultErrorText will likely indicate that the task was aborted.

	//  A "completed" task will have a StatusInt equal to 7.
	//  If the task finished, but was not completed, then it must've
	//  been aborted or canceled:
	if ([task.StatusInt intValue] != 7) {
	    NSLog(@"%@",@"Task did not complete.");
	    NSLog(@"%@%@",@"task status: ",task.Status);
	    return;
	}

	// Check the return value of the underlying task
	if ([task GetResultBool] != YES) {
		NSLog(@"%@",task.ResultErrorText);
		return;
	}


	NSLog(@"%@",@"File Downloaded!");
}

