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
        char character;
        
        charString = [finishedString substringWithRange:NSMakeRange(i, 1)];
        //character = [aString characterAtIndex:i];
        //charString = [NSString stringWithFormat:@"%c",character];
        NSRange upperRange = [uppercaseAlphabet rangeOfString:charString];
        NSRange lowerRange = [lowercaseAlphabet rangeOfString:charString];
        
        if (upperRange.location != NSNotFound)
        {
            NSRange shift = NSMakeRange ((upperRange.location+offset)%[uppercaseAlphabet length], 1);
            character = [uppercaseAlphabet characterAtIndex:shift.location];
            charString = [NSString stringWithFormat:@"%c",character];
        }
        
        if (lowerRange.location != NSNotFound)
        {
            NSRange shift = NSMakeRange ((lowerRange.location+offset)%[lowercaseAlphabet length], 1);
            character = [lowercaseAlphabet characterAtIndex:shift.location];
            charString = [NSString stringWithFormat:@"%c",character];
        }
        
        [finishedString appendString:charString];
    }
    return finishedString;
}



@end
