//
//  QInlinePickerTableViewCell.m
//  easyPush
//
//  Created by Sebastian Rusu on 2/17/14.
//  Copyright (c) 2014 Futurecom interactive AG. All rights reserved.
//

#import "QInlinePickerTableViewCell.h"

@interface QInlinePickerTableViewCell() <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, weak) QInlinePickerElement* element;

@end

@implementation QInlinePickerTableViewCell

- (QInlinePickerTableViewCell*)init {
    self = [super initWithReuseIdentifier:@"QInlinePickerTableViewCell"];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    if (!self.pickerView) {
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0,
                                                                         kInlinePickerElementHeight,
                                                                         CGRectGetMinX(self.textLabel.frame),
                                                                         kInlinePickerElementExpandedHeight - kInlinePickerElementHeight)];
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        self.pickerView.showsSelectionIndicator = YES;
        
        [self.contentView addSubview:self.pickerView];
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.clipsToBounds = YES;
    self.contentView.clipsToBounds = YES;
}

- (void)prepareForElement:(QInlinePickerElement*)element {
    self.element = element;
    
    self.textLabel.text = self.element.title;
    
    self.detailTextLabel.text = [self.element.items objectAtIndex:self.element.selected];
    
    [self.pickerView reloadAllComponents];
    [self.pickerView selectRow:self.element.selected
                   inComponent:0
                      animated:YES];
    
    [self applyAppearanceForElement:self.element];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(CGRectGetMinX(self.textLabel.frame),
                                      0.0,
                                      CGRectGetWidth(self.textLabel.frame),
                                      kInlinePickerElementHeight);
    self.textLabel.backgroundColor = [UIColor clearColor];
    
    self.detailTextLabel.frame = CGRectMake(CGRectGetMaxX(self.textLabel.frame),
                                            0.0,
                                            CGRectGetWidth(self.contentView.frame) - CGRectGetMaxX(self.textLabel.frame) - CGRectGetMinX(self.textLabel.frame),
                                            kInlinePickerElementHeight);
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    self.pickerView.frame = CGRectMake(CGRectGetMinX(self.textLabel.frame),
                                       kInlinePickerElementHeight,
                                       CGRectGetWidth(self.contentView.frame) - (2.0 * CGRectGetMinX(self.textLabel.frame)),
                                       kInlinePickerElementExpandedHeight - kInlinePickerElementHeight);
    self.pickerView.backgroundColor = [UIColor clearColor];
}

#pragma mark - UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.element.items.count;
}

#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.element.items objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.element.selected = row;
    
    self.detailTextLabel.text = [self.element.items objectAtIndex:self.element.selected];
    
    if (self.element.onValueChanged) {
        self.element.onValueChanged(self.element);
    }
}

@end
