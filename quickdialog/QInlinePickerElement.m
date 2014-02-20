//
//  QInlinePickerElement.m
//  easyPush
//
//  Created by Sebastian Rusu on 2/17/14.
//  Copyright (c) 2014 Futurecom interactive AG. All rights reserved.
//

#import "QInlinePickerElement.h"
#import "QInlinePickerTableViewCell.h"

@interface QInlinePickerElement()

@property (nonatomic, assign) BOOL expanded;

@end

@implementation QInlinePickerElement

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    QInlinePickerTableViewCell *cell = (QInlinePickerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"QInlinePickerTableViewCell"];
    if (!cell) {
        cell = [[QInlinePickerTableViewCell alloc] init];
    }
    
    [cell prepareForElement:self];
  
    return cell;
}

- (CGFloat)getRowHeightForTableView:(QuickDialogTableView *)tableView {
    return (self.expanded ? kInlinePickerElementExpandedHeight : kInlinePickerElementHeight);
}

- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)path {
    self.expanded = !self.expanded;
    [tableView reloadCellForElements:self, nil];
}

@end
