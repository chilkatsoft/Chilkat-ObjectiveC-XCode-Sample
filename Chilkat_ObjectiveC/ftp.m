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

BOOL ftp_unlock()
{
    CkoFtp2 *ftp = [[CkoFtp2 alloc] init];
    
    //  Any string unlocks the component for the 1st 30-days.
    BOOL success = [ftp UnlockComponent: @"Anything for 30-day trial"];
    if (success != YES) {
        NSLog(@"%@",ftp.LastErrorText);
        return NO;
    }

    return YES;
}

void ftp_settings(CkoFtp2 *ftp)
{
    ftp.Hostname = @"ftp.your-ftp-server.com";
    ftp.Username = @"xxx";
    ftp.Password = @"xxx";

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
