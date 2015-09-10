//
//  CoverFlowLayout.m
//  CoverFlowLayout
//
//  Created by Katherine Peterson on 2015-09-10.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "CoverFlowLayout.h"
#import <QuartzCore/QuartzCore.h>

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

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray* attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size   = self.collectionView.bounds.size;
    
    // Modify the layout attributes as needed here
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        CGFloat visibleCenter = visibleRegion.size.width/2;
        CGFloat attributeCenter = (attribute.center.x - visibleRegion.origin.x);
        CGFloat quadVisibleCenter = 4*visibleCenter;
        
        attribute.alpha = 1-(fabs(attributeCenter - visibleCenter)/visibleCenter);
        attribute.transform3D = CATransform3DScale(attribute.transform3D, 1-(fabs(attributeCenter - visibleCenter)/quadVisibleCenter), 1-(fabs(attributeCenter - visibleCenter)/quadVisibleCenter), 0);
    }
    return attributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


@end
