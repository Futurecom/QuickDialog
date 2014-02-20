//
//  QInlinePickerElement.h
//  easyPush
//
//  Created by Sebastian Rusu on 2/17/14.
//  Copyright (c) 2014 Futurecom interactive AG. All rights reserved.
//

#import "QuickDialog.h"

static const CGFloat kInlinePickerElementHeight = 44.0;
static const CGFloat kInlinePickerElementExpandedHeight = kInlinePickerElementHeight + 216.0;

@interface QInlinePickerElement : QRootElement

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) NSUInteger selected;

@end
