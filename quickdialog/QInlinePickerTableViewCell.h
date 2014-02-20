//
//  QInlinePickerTableViewCell.h
//  easyPush
//
//  Created by Sebastian Rusu on 2/17/14.
//  Copyright (c) 2014 Futurecom interactive AG. All rights reserved.
//

#import <QuickDialog.h>
#import "QInlinePickerElement.h"

@interface QInlinePickerTableViewCell : QTableViewCell

- (void)prepareForElement:(QInlinePickerElement*)element;

@end
