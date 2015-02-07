//
//  SongSvcArchive.m
//  I-transpose_TableView
//
//  Created by Phuong Nguyen on 2/6/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "SongSvcArchive.h"

@implementation SongSvcArchive


- (Song *) createSong: (Song *) song
{
    
    NSLog(@"SongSvc.createSong: %@", [song description]);
    
    [songs addObject:song];
    [self writeArchive];
    
    return song;
}

- (NSMutableArray *) retrieveAllSongs
{
    return songs;
}


- (Song *) updateSong: (Song *) song
{
    return song;
}
- (Song *) deleteSong: (Song *) song
{
    return song;
}


NSString *filePath;

NSMutableArray *songs;

-(id) init
{
    
    NSArray *dirPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString: [docsDir
                                                  stringByAppendingPathComponent: @"Songs.archive"]];
    [self readArchive];
    
    return self;
}

-(void) readArchive
{
  
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: filePath])
    {
        songs = [NSKeyedUnarchiver unarchiveObjectWithFile: filePath];
    }
    else
    {
        songs = [NSMutableArray array];
    }
    
    
}

-(void) writeArchive
{
    
    [NSKeyedArchiver archiveRootObject: songs toFile:filePath];
    
}

@end
