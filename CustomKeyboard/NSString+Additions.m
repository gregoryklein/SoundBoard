//
//  NSString+Additions.m
//  SoundBoard
//
//  Created by Gregory Klein on 3/17/15.
//  Copyright (c) 2015 Pure Virtual Studios, LLC. All rights reserved.
//

#import "NSString+Additions.h"

static BOOL _containsLetters(NSString* string)
{
   BOOL containsLetters = NO;
   for (int i = 0; i < string.length; ++i)
   {
      unichar character = [string characterAtIndex:i];
      if ([[NSCharacterSet letterCharacterSet] characterIsMember:character])
      {
         containsLetters = YES;
         break;
      }
   }
   return containsLetters;
}

@implementation NSString (Additions)

- (BOOL)isUppercase
{
   BOOL uppercase = NO;
   if (self.length > 0)
   {
      unichar firstCharacter = [self characterAtIndex:0];
      uppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:firstCharacter];
   }
   return uppercase;
}

- (NSString*)titleCase
{
   NSString* titleCaseString = nil;
   if (self.length > 0)
   {
      titleCaseString = [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                      withString:[[self substringToIndex:1] capitalizedString]];
   }
   return titleCaseString;
}

- (NSString*)quotedString
{
   return [NSString stringWithFormat:@"\"%@\"", self];
}
- (BOOL)isValidForCorrecting
{
   BOOL isValid = YES;
   if (self.length > 0)
   {
      unichar firstCharacter = [self characterAtIndex:0];
      if ([[NSCharacterSet letterCharacterSet] characterIsMember:firstCharacter])
      {
         NSInteger firstNonLetterCharacterIndex = -1;
         NSInteger firstLetterCharacterIndexAfterNonLetterCharacter = -1;
         for (NSUInteger charIndex = 0; charIndex < self.length; ++charIndex)
         {
            unichar currentChar = [self characterAtIndex:charIndex];
            if (![[NSCharacterSet letterCharacterSet] characterIsMember:currentChar] && firstNonLetterCharacterIndex == -1)
            {
               firstNonLetterCharacterIndex = charIndex;
            }
            else if ([[NSCharacterSet letterCharacterSet] characterIsMember:currentChar] && firstNonLetterCharacterIndex > 0 && firstLetterCharacterIndexAfterNonLetterCharacter == -1)
            {
               firstLetterCharacterIndexAfterNonLetterCharacter = charIndex;
            }
         }
         if (firstNonLetterCharacterIndex != -1 && firstLetterCharacterIndexAfterNonLetterCharacter != -1)
         {
            isValid = NO;
         }
      }
      else
      {
         NSInteger firstLetterCharacterIndex = -1;
         NSInteger firstNonLetterCharacterIndexAfterLetterCharacter = -1;
         for (NSUInteger charIndex = 0; charIndex < self.length; ++charIndex)
         {
            unichar currentChar = [self characterAtIndex:charIndex];
            if ([[NSCharacterSet letterCharacterSet] characterIsMember:currentChar] && firstLetterCharacterIndex == -1)
            {
               firstLetterCharacterIndex = charIndex;
            }
            else if (![[NSCharacterSet letterCharacterSet] characterIsMember:currentChar] && firstLetterCharacterIndex > 0 && firstNonLetterCharacterIndexAfterLetterCharacter == -1)
            {
               firstNonLetterCharacterIndexAfterLetterCharacter = charIndex;
            }
         }
         if (firstLetterCharacterIndex != -1 && firstNonLetterCharacterIndexAfterLetterCharacter != -1)
         {
            isValid = NO;
         }
      }
   }
   return isValid && _containsLetters(self);
}

- (NSString*)letterCharacterString
{
   NSString* string = [NSString stringWithString:self];
   if (self.length > 0)
   {
      NSUInteger firstNonLetterCharIndex = -1;
      NSUInteger lastNonLetterCharIndex = -1;

      for (int charIndex = 0; charIndex < string.length; ++charIndex)
      {
         unichar currentChar = [self characterAtIndex:charIndex];
         if (![[NSCharacterSet letterCharacterSet] characterIsMember:currentChar])
         {
            if (firstNonLetterCharIndex == -1)
            {
               firstNonLetterCharIndex = charIndex;
            }
            else
            {
               lastNonLetterCharIndex = charIndex;
            }
         }
      }

      if (firstNonLetterCharIndex == 0 && lastNonLetterCharIndex != -1)
      {
         string = [string substringFromIndex:lastNonLetterCharIndex + 1];
      }
      else if (firstNonLetterCharIndex != -1 && lastNonLetterCharIndex != -1)
      {
         string = [string substringToIndex:firstNonLetterCharIndex];
      }
   }
   return string;
}

- (NSString*)nonLetterCharacterString
{
   NSString* string = [NSString stringWithString:self];
   if (self.length > 0)
   {
      NSUInteger firstNonLetterCharIndex = -1;
      NSUInteger lastNonLetterCharIndex = -1;

      for (int charIndex = 0; charIndex < string.length; ++charIndex)
      {
         unichar currentChar = [self characterAtIndex:charIndex];
         if (![[NSCharacterSet letterCharacterSet] characterIsMember:currentChar])
         {
            if (firstNonLetterCharIndex == -1)
            {
               firstNonLetterCharIndex = charIndex;
            }
            else
            {
               lastNonLetterCharIndex = charIndex;
            }
         }
      }

      if (firstNonLetterCharIndex == 0 && lastNonLetterCharIndex != -1)
      {
         string = [string substringToIndex:lastNonLetterCharIndex + 1];
      }
      else if (firstNonLetterCharIndex != -1 && lastNonLetterCharIndex != -1)
      {
         string = [string substringFromIndex:firstNonLetterCharIndex];
      }
      else
      {
         string = @"";
      }
   }
   return string;
}

- (NSString*)stringByReplacingLetterCharactersWithString:(NSString*)string
{
   NSString* letterString = self.letterCharacterString;
   return [self stringByReplacingOccurrencesOfString:letterString withString:string];
}

@end
