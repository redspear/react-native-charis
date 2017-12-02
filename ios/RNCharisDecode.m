
#import "RNCharisDecode.h"

@implementation RNCharisDecode

// - (dispatch_queue_t)methodQueue
// {
//     return dispatch_get_main_queue();
// }

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(decodeLesson:(NSString *)path
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {

    BOOL decoded = NO;

    NSFileManager *filemgr;
    NSFileHandle  *file;
    NSData        *firstData;
    NSData        *LastData;

    filemgr = [NSFileManager defaultManager];

    if ([filemgr isWritableFileAtPath:path]  == YES)
    {
        NSLog (@"File is writable");

        file = [NSFileHandle fileHandleForUpdatingAtPath:path];
        if (file == nil)
            NSLog(@"Failed to open file");
        else
        {
            firstData = [file readDataOfLength:4];
            NSLog (@"First 4byte = %@", firstData);

            [file seekToEndOfFile];
            [file seekToFileOffset:[file offsetInFile] - 4];
            LastData = [file readDataOfLength:4];
            NSLog (@"last  4byte = %@", LastData);

            // Check last data is 1c. If it is then it needs decoding.
            // Fixes issue with upgrade from old 1.5 version of iCharis where app
            // decoded the whole class rather than each lesson.
            NSString *str = [NSString stringWithFormat:@"%@", LastData];
            NSLog (@"last  4byte = %@", str);
            [file  seekToFileOffset:0];
            [file writeData:LastData];
            
            [file seekToEndOfFile];
            [file seekToFileOffset:[file offsetInFile] - 4];
            [file writeData:firstData];
            if ([str isEqualToString:@"<0000001c>"]) {
              NSLog (@"last  4byte isTrue");
            } else
              NSLog (@"last  4byte isFalse");

            decoded = YES;
        }

        [file closeFile];
    }
    else
        reject(@"File is read only", @"file to decode is read only", nil);

    resolve(@(decoded));

}

@end
