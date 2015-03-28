//
//  CoverFlowLayout.m
//  CoverFlow
//
//  Created by Shahin on 2015-03-27.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

static const CGFloat ACTIVE_DISTANCE = 200.0f;
static const CGFloat ZOOM_FACTOR = 0.3f;


-(void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(220.0, 330.0);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

- (id)init
{
    self = [super init];
    
    if(self) {
        self.itemSize = CGSizeMake(220.0f, 330.0f);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(200.0f, 0.0f, 200.0f, 0.0f);
        self.minimumLineSpacing = 100.0f;
    }
    
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            
            // Apply a zoom factor to cells within ACTIVE_DISTANCE
            if (ABS(distance) < ACTIVE_DISTANCE) {
                CGFloat zoom = 1.0f + ZOOM_FACTOR * (1.0f - ABS(normalizedDistance));
                attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attribute.zIndex = round(zoom);
            }
            else {
                CGFloat zoom = 1.0f + ZOOM_FACTOR * (1.0f - ABS(normalizedDistance));
                attribute.transform3D = CATransform3DMakeRotation(100.0, 0.0, 20.0, 0.0);
                attribute.zIndex = round(zoom);
            }
        }
    }
    
    return attributes;
}

@end
