//
//  TestCell.m
//  CollectionViewSizingTest
//
//  Created by Pete Callaway on 26/11/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell

+ (NSString*)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib*)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

+ (TestCell*)cell {
    return [[[self nib] instantiateWithOwner:nil options:nil] firstObject];
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    
    // Fix the content view being wrong when our bounds are set
    self.contentView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
}

@end
