//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ___VARIABLE_classPrefix:identifier___CollectionViewCell : UICollectionViewCell

+ (NSString *)defaultCollectionViewCellIdentifier;
+ (NSString *)defaultCollectionViewCellNibName;
+ (UINib *)defaultNib;

+ (void)registerCellWithCollectionView:(UICollectionView *)collectionView;
+ (id)cellForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end

@interface ___VARIABLE_classPrefix:identifier___CollectionViewCell (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (void)finishInitialize;
- (void)configureForData:(id)dataObject collectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end