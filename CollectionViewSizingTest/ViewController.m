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
    itemSize.height = 100; // TODO use the sizing cell to determine the height for the calculated width

    // TODO - Change the layout so the item's width and height are correct for different screen sizes
//     UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
//     flowLayout.itemSize = itemSize;
    
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