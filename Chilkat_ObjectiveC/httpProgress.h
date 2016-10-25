//
//  httpProgress.h
//  Chilkat_ObjectiveC
//
//  Created by Chilkat on 9/22/16.
//  Copyright © 2016 Chilkat. All rights reserved.
//

#ifndef httpProgress_h
#define httpProgress_h

#import "chilkat/include/CkoHttpProgress.h"


@interface httpProgress : CkoHttpProgress {
}

- (void)PercentDone: (NSNumber *)pctDone abort: (BOOL *)abort;
- (void)ProgressInfo:(NSString *)pinfName value:(NSString *)pinfValue;
@end


#endif