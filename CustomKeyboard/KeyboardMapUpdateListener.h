//
//  KeyboardMapProviderProtocol.h
//  SoundBoard
//
//  Created by Klein, Greg on 1/26/15.
//  Copyright (c) 2015 Pure Virtual Studios, LLC. All rights reserved.
//

#ifndef SoundBoard_KeyboardMapProviderProtocol_h
#define SoundBoard_KeyboardMapProviderProtocol_h

@import UIKit;
@class KeyboardKeyFrameTextMap;

@protocol KeyboardKeyFrameTextMapUpdater <NSObject>
@required
- (void)updateKeyboardKeyFrameTextMap:(KeyboardKeyFrameTextMap*)keyFrameTexMap;
@end

#endif
