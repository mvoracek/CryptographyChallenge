//
//  ViewController.m
//  CryptographyChallenge
//
//  Created by Matthew Voracek on 4/3/14.
//  Copyright (c) 2014 Matthew Voracek. All rights reserved.
//

#import "ViewController.h"

NSString *const inputString = @"Hello camrade, I bring news from Oceania. We will soon feast on kangaroo meat. Their defences are weak and I can't spell \"defense\". Keep hope alive and aviod the grue.";
NSString *const successString = @"Uryyb pnzenqr, V oevat arjf sebz Bprnavn. Jr jvyy fbba srnfg ba xnatnebb zrng. Gurve qrsraprf ner jrnx naq V pna'g fcryy \"qrsrafr\". Xrrc ubcr nyvir naq nivbq gur tehr.";
NSString *const uppercaseAlphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
NSString *const lowercaseAlphabet = @"abcdefghijklmnopqrstuvwxyz";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *output = [self encodeString:inputString withOffset:13];
    
    NSLog(@"%@", output);
    if ([output isEqualToString:successString])
    {
        NSLog(@"Successful cypher! Congratulations.");
    }
    
}

-(NSString *)encodeString:(NSString *)aString withOffset:(NSUInteger)offset
{
    NSMutableString *finishedString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < [aString length]; i++)
    {
        NSString *charString;
        
        charString = [aString substringWithRange:NSMakeRange(i, 1)];
        
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[charString characterAtIndex:0]])
        {
            charString = [self shiftCharacterOfString:charString ForAlphabetString:uppercaseAlphabet WithOffset:offset];
        }
        else if ([[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[charString characterAtIndex:0]])
        {
            charString = [self shiftCharacterOfString:charString ForAlphabetString:lowercaseAlphabet WithOffset:offset];
        }
        else
        {
            //for characters other than letters
        }
        
        [finishedString appendString:charString];
    }
    return finishedString;
}

-(NSString *)shiftCharacterOfString:(NSString *)cString ForAlphabetString:(NSString *)alphaString WithOffset: (NSUInteger)offset
{
    NSRange range = [alphaString rangeOfString:cString];
    NSRange shift = NSMakeRange ((range.location+offset)%[alphaString length], 1);
    NSString *charString = [alphaString substringWithRange:shift];
    return charString;
}


@end
