//
//  AlternateKeysView.h
//  SoundBoard
//
//  Created by Klein, Greg on 2/21/15.
//  Copyright (c) 2015 Pure Virtual Studios, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AltKeysViewDirection)
{
   AltKeysViewDirectionCenter = 0,
   AltKeysViewViewDirectionLeft,
   AltKeysViewDirectionRight
};

@class KeyView;
@interface AlternateKeysView : UIView

+ (instancetype)viewWithKeyView:(KeyView*)keyView direction:(AltKeysViewDirection)direction;
- (void)updateFrame:(CGRect)frame;

@property (nonatomic) AltKeysViewDirection direction;
@end
