//
//  SongSvcCache.m
//  I-transpose_TableView
//
//  Created by Phuong Nguyen on 1/24/15.
//  Copyright (c) 2015 msse650. All rights reserved.
//

#import "SongSvcCache.h"

@implementation SongSvcCache

NSMutableArray *songs = nil;

- (id) init
{
    if (self = [super init])
    {
        songs = [NSMutableArray array];
        return self;
    }
    return nil;
}

- (Song *) createSong: (Song *) song {
    [songs addObject: song];
    return song;
}
- (NSMutableArray *) retrieveAllSongs {
    return songs;
}
- (Song *) updateSong:(Song *) song {
    return song;
}
- (Song *) deleteSong: (Song *) song {
    return song;
}

@end
