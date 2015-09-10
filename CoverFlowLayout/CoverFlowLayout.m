//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by Katherine Peterson on 2015-09-10.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "CoverFlowLayout.h"

@interface CoverFlowLayout ()

@property (strong, nonatomic) NSMutableArray *itemAttributes;
@property (strong, nonatomic) NSMutableArray *itemsSize;
@property (nonatomic, assign) CGSize contentSize;

@end

@implementation CoverFlowLayout

-(void)prepareLayout {
    [super prepareLayout];
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width/3, self.collectionView.frame.size.height/2);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}


@end
