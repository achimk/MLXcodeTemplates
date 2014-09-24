//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ___VARIABLE_classPrefix:identifier___TableViewCell : UITableViewCell

+ (UITableViewCellStyle)defaultTableViewCellStyle;
+ (NSString *)defaultTableViewCellIdentifier;
+ (NSString *)defaultTableViewCellNibName;
+ (UINib *)defaultNib;
+ (CGFloat)defaultTableViewCellHeight;

+ (void)registerCellWithTableView:(UITableView *)tableView;
+ (id)cellForTableView:(UITableView *)tableView;
+ (id)cellForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

@interface ___VARIABLE_classPrefix:identifier___TableViewCell (___VARIABLE_classPrefix:identifier___SubclassOnly)

- (void)finishInitialize;
- (void)configureForData:(id)dataObject tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end