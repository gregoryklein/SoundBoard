//
//  KeyboardLetterLayer.h
//  SoundBoard
//
//  Created by Klein, Greg on 1/23/15.
//  Copyright (c) 2015 Pure Virtual Studios, LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface KeyboardKeyLayer : CATextLayer

+ (instancetype)layerWithLetter:(NSString*)letter;
+ (instancetype)layerWithLetter:(NSString *)letter fontSize:(CGFloat)fontSize;

@end