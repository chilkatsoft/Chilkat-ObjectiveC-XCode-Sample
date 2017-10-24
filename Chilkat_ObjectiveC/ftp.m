//
//  ftp.m
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ftpProgress.h"
#import "chilkat/include/CkoFtp2.h"
#import "chilkat/include/CkoTask.h"

void ftp_settings(CkoFtp2 *ftp)
{
    ftp.Hostname = @"ftp.your-ftp-server.com";
    ftp.Username = @"xxx";
    ftp.Password = @"xxx";
    ftp.AuthTls = YES;
}

void test_ftpDownload()
{
    
    CkoFtp2 *ftp = [[CkoFtp2 alloc] init];
    ftpProgress *ftp_progress = [[ftpProgress alloc] init];
    [ftp setEventCallbackObject: ftp_progress];
    
    ftp_settings(ftp);
    
    //  Connect and login to the FTP server.
    BOOL success = [ftp ConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    success = [ftp LoginAfterConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    //  Change to the remote directory where the file is located.
    //  This step is only necessary if the file is not in the home directory
    //  of the FTP account.
    //success = [ftp ChangeRemoteDir: @"junk"];
    //if (success != YES) {
    //    NSLog(@"%@",ftp.LastErrorText);
    //    return;
    //}
    
    NSString *localFilename = @"hamlet.xml";
    NSString *remoteFilename = @"hamlet.xml";
    
    //  Ensure that we get PercentDone callbacks.
    ftp.AutoGetSizeForProgress = YES;
    
    //  Download the file.
    success = [ftp GetFile: remoteFilename localPath: localFilename];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    success = [ftp Disconnect];
    
    NSLog(@"%@",@"File Downloaded!");
}

void test_asyncFtpDownload()
{
    
    CkoFtp2 *ftp = [[CkoFtp2 alloc] init];
    ftpProgress *ftp_progress = [[ftpProgress alloc] init];
    [ftp setEventCallbackObject: ftp_progress];
    
    ftp_settings(ftp);
    
    //  Connect and login to the FTP server.
    BOOL success = [ftp ConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    success = [ftp LoginAfterConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    //  Change to the remote directory where the file is located.
    //  This step is only necessary if the file is not in the home directory
    //  of the FTP account.
    //success = [ftp ChangeRemoteDir: @"junk"];
    //if (success != YES) {
    //    NSLog(@"%@",ftp.LastErrorText);
    //    return;
    //}
    
    NSString *localFilename = @"hamlet.xml";
    NSString *remoteFilename = @"hamlet.xml";
    
    //  Ensure that we get PercentDone callbacks.
    ftp.AutoGetSizeForProgress = YES;
    
    //  Download the file.
    CkoTask *task = [ftp GetFileAsync: remoteFilename localPath: localFilename];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
  
    
    if (task == nil ) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    //  Schedule the task for running on the thread pool.  This changes the task's state
    //  from Inert to Live.
    success = [task Run];
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
    
    
    success = [ftp Disconnect];
    
    NSLog(@"%@",@"File Downloaded!");
}

void test_ftpUpload()
{
    
    CkoFtp2 *ftp = [[CkoFtp2 alloc] init];
    ftpProgress *ftp_progress = [[ftpProgress alloc] init];
    [ftp setEventCallbackObject: ftp_progress];
    
    ftp_settings(ftp);
    
    //  Connect and login to the FTP server.
    BOOL success = [ftp ConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    success = [ftp LoginAfterConnectOnly];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    //  Change to the remote directory where the file is located.
    //  This step is only necessary if the file is not in the home directory
    //  of the FTP account.
    //success = [ftp ChangeRemoteDir: @"junk"];
    //if (success != YES) {
    //    NSLog(@"%@",ftp.LastErrorText);
    //    return;
    //}
    
    NSString *localFilename = @"hamlet.xml";
    NSString *remoteFilename = @"hamlet2.xml";
    
    //  Ensure that we get PercentDone callbacks.
    ftp.AutoGetSizeForProgress = YES;
    
    //  Download the file.
    success = [ftp PutFile: localFilename remoteFilename: remoteFilename];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return;
    }
    
    success = [ftp Disconnect];
    
    NSLog(@"%@",@"File Uploaded!");
}
