//
//  CustomCollectionViewController.m
//  CoverFlow
//
//  Created by Shahin on 2015-03-27.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "CustomCollectionViewController.h"

@interface CustomCollectionViewController ()

@property (nonatomic, strong) NSArray *allPhotos;
@property (nonatomic, strong) NSArray *photosBySubject;
@property (nonatomic, strong) NSArray *photosByLocation;
@property (nonatomic, strong) CoverFlowLayout *coverFlowLayout;

@end

@implementation CustomCollectionViewController

static NSString * const reuseIdentifier = @"Photo";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    Photo *photo01 = [[Photo alloc] initWithTitle:@"IMG01.JPG"
                                          subject:@"Artsy"
                                         location:@"Inside"];
    
    Photo *photo02 = [[Photo alloc] initWithTitle:@"IMG02.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo03 = [[Photo alloc] initWithTitle:@"IMG03.JPG"
                                          subject:@"Artsy"
                                         location:@"Outside"];
    
    Photo *photo04 = [[Photo alloc] initWithTitle:@"IMG04.JPG"
                                          subject:@"Objects"
                                         location:@"Computer"];
    
    Photo *photo05 = [[Photo alloc] initWithTitle:@"IMG05.JPG"
                                          subject:@"Nature"
                                         location:@"Indide"];
    
    Photo *photo06 = [[Photo alloc] initWithTitle:@"IMG06.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo07 = [[Photo alloc] initWithTitle:@"IMG07.JPG"
                                          subject:@"Nature"
                                         location:@"Computer"];
    
    Photo *photo08 = [[Photo alloc] initWithTitle:@"IMG08.JPG"
                                          subject:@"Artsy"
                                         location:@"Computer"];
    
    Photo *photo09 = [[Photo alloc] initWithTitle:@"IMG09.JPG"
                                          subject:@"Objects"
                                         location:@"Inside"];
    
    Photo *photo10 = [[Photo alloc] initWithTitle:@"IMG10.JPG"
                                          subject:@"Nature"
                                         location:@"Outside"];
    
    self.allPhotos = @[photo01, photo02, photo03, photo04, photo05, photo06, photo07, photo08, photo09, photo10];
    
    NSArray *artsyPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Artsy"]];
    NSArray *objectPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Objects"]];
    NSArray *naturePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithSubject:@"Nature"]];
    
    self.photosBySubject = @[artsyPhotos, objectPhotos, naturePhotos];
    
    NSArray *computerPhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Computer"]];
    NSArray *insidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Inside"]];
    NSArray *outsidePhotos = [self.allPhotos filteredArrayUsingPredicate:[self predicateWithLocation:@"Outside"]];
    
    self.photosByLocation = @[computerPhotos, insidePhotos, outsidePhotos];
}


-(NSPredicate *)predicateWithSubject:(NSString *)subject {
    return [NSPredicate predicateWithFormat:@"SELF.subject contains[c] '%@'", subject];
}

-(NSPredicate *)predicateWithLocation:(NSString *)location {
    return [NSPredicate predicateWithFormat:@"SELF.subject contains[c] '%@'", location];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.allPhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell
    PhotoCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Photo *photo = [self.allPhotos objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.photoCellImageView.image = [UIImage imageNamed:photo.title];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
