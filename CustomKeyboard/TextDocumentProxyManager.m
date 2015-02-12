//
//  TextDocumentProxyManager.m
//  SoundBoard
//
//  Created by Klein, Greg on 1/29/15.
//  Copyright (c) 2015 Pure Virtual Studios, LLC. All rights reserved.
//

#import "TextDocumentProxyManager.h"

static TextDocumentProxyManager* s_textDocumentProxyManager = nil;

@interface TextDocumentProxyManager ()
@property (weak, nonatomic) id<UITextDocumentProxy> proxy;
@end

@implementation TextDocumentProxyManager

#pragma mark - Helper
+ (TextDocumentProxyManager*)lazyLoadedManager
{
   if (s_textDocumentProxyManager == nil)
   {
      s_textDocumentProxyManager = [TextDocumentProxyManager new];
   }
   return s_textDocumentProxyManager;
}

#pragma mark - Class Init
+ (void)setTextDocumentProxy:(id<UITextDocumentProxy>)proxy
{
   [[self class] lazyLoadedManager].proxy = proxy;
}

#pragma mark - Class Methods
+ (void)insertText:(NSString*)text;
{
   [[[self class] lazyLoadedManager].proxy insertText:text];
}

+ (BOOL)deleteBackward
{
   NSString * text = [self documentContextBeforeInput];
   BOOL deletedUppercase = NO;
   if (text && text.length)
   {
      unichar character = [text characterAtIndex:text.length - 1];
      deletedUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:character];
   }
   
   [[[self class] lazyLoadedManager].proxy deleteBackward];
   
   return deletedUppercase;
}

+ (void)adjustTextPositionByCharacterOffset:(NSInteger)offset
{
   [[[self class] lazyLoadedManager].proxy adjustTextPositionByCharacterOffset:offset];
}

#pragma mark - Property Overrides
+ (NSString*)documentContextBeforeInput
{
   return [[self class] lazyLoadedManager].proxy.documentContextBeforeInput;
}

+ (NSString*)documentContextAfterInput
{
   return [[self class] lazyLoadedManager].proxy.documentContextAfterInput;
}

@end
