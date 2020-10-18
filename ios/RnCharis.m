#import "RnCharis.h"

@implementation RnCharis

RCT_EXPORT_MODULE()

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

            [file seekToEndOfFile];
            [file seekToFileOffset:[file offsetInFile] - 4];
            LastData = [file readDataOfLength:4];

            // Check last data is 1c. If it is then it needs decoding.
            // Fixes issue with upgrade from old 1.5 version of iCharis where app
            // decoded the whole class rather than each lesson.
            NSString *str = [NSString stringWithFormat:@"%@", LastData];
            [file  seekToFileOffset:0];
            [file writeData:LastData];
            
            [file seekToEndOfFile];
            [file seekToFileOffset:[file offsetInFile] - 4];
            [file writeData:firstData];

            decoded = YES;
        }

        [file closeFile];
        resolve(@(decoded));
    }
    else
        reject(@"not_found", @"File not found or is read only", nil);
}

@end
