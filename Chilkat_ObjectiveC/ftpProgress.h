//
//  ftpProgress.h
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#ifndef ftpProgress_h
#define ftpProgress_h

#import "chilkat/include/CkoFtp2Progress.h"


@interface ftpProgress : CkoFtp2Progress {
}

- (void)PercentDone: (NSNumber *)pctDone abort: (BOOL *)abort;
- (void)ProgressInfo:(NSString *)pinfName value:(NSString *)pinfValue;
@end


#endif /* ftpProgress_h */
