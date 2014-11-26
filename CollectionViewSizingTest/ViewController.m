//
//  ViewController.m
//  CollectionViewSizingTest
//
//  Created by Pete Callaway on 26/11/2014.
//  Copyright (c) 2014 Dative Studios. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()

@property (nonatomic, strong) TestCell *sizingCell;

@end


@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        _sizingCell = [TestCell cell];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat const cellsPerRow = 2.0;
    CGFloat const cellSpacing = 10.0;
    CGSize itemSize = CGSizeZero;

    itemSize.width = floorf( (self.view.bounds.size.width - (cellSpacing * (cellsPerRow + 1))) / cellsPerRow);
    
    // Adding a view with a width constraint to the sizing cell
    {
        // Create a view we can use to fix the cell's width
        UIView *fixedWidthView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.sizingCell.contentView.bounds.size.width, 1)];
        fixedWidthView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.sizingCell.contentView addSubview:fixedWidthView];
 
        // Create constraints on the sizing view
        NSDictionary *views = NSDictionaryOfVariableBindings(fixedWidthView);
        NSDictionary *metrics = @{@"width" : @(itemSize.width), @"height" : @(1.0)};
        
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[fixedWidthView(width)]|" options:0 metrics:metrics views:views];
        [fixedWidthView.superview addConstraints:constraints];

        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[fixedWidthView(height)]" options:0 metrics:metrics views:views];
        [fixedWidthView.superview addConstraints:constraints];
        
        // Get the cell's size for the width
        itemSize = [self.sizingCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        // Clean up
        [fixedWidthView removeFromSuperview];
    }
    
    // Change the layout so the item's width and height are correct for different screen sizes
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
    flowLayout.itemSize = itemSize;
    flowLayout.minimumInteritemSpacing = cellSpacing;
    flowLayout.minimumLineSpacing = cellSpacing;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, cellSpacing, 0, cellSpacing);
    
    [self.collectionView registerNib:[TestCell nib] forCellWithReuseIdentifier:[TestCell reuseIdentifier]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:[TestCell reuseIdentifier] forIndexPath:indexPath];
}

@end
