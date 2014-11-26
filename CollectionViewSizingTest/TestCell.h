//
//  TestCell.h
//  CollectionViewSizingTest
//
//  Created by Pete Callaway on 26/11/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UICollectionViewCell

+ (NSString*)reuseIdentifier;
+ (UINib*)nib;
+ (TestCell*)cell;

@end
