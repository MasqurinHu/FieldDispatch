//
//  MemberTVCell.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/29.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MemberTVCell.h"

@interface MemberTVCell()
{
    AdvanceImageView *photo;
    UILabel *name;
    UILabel *tel;
    UILabel *status;
    
}
@end

@implementation MemberTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    photo = [AdvanceImageView new];
    [self addSubview:photo];
    photo.translatesAutoresizingMaskIntoConstraints = false;
    [UIView initSizeWithSelf:photo \
                  TargetView:self
                   SuperView:self
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:.00001
                 MultiplierY:.00001
                        GapX:60.0
                        GapY:60.0];
    [UIView initAtLeftCenterWithSelf:photo
                           SuperView:self
                            LevelGap:4.0
                         VerticalGap:.0];
    
    name = [UILabel new];
    [self addSubview:name];
    name.translatesAutoresizingMaskIntoConstraints = false;
    [name sizeToFit];
    [UIView initAtCenterTopWithSelf:name
                          SuperView:self
                           LevelGap:.0
                        VerticalGap:4.0];
    
    tel = [UILabel new];
    [self addSubview:tel];
    tel.translatesAutoresizingMaskIntoConstraints = false;
    [tel sizeToFit];
    [UIView initAtCenterCenterWithSelf:tel
                             SuperView:self
                              LevelGap:.0
                           VerticalGap:.0];
    
    status = [UILabel new];
    [self addSubview:status];
    status.translatesAutoresizingMaskIntoConstraints = false;
    [status sizeToFit];
    [UIView initAtCenterBottonWithSelf:status
                             SuperView:self
                              LevelGap:.0
                           VerticalGap:-4.0];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)reload {
    
    
    
//    NSURL *url = [NSURL URLWithString:[MemberDatabase stand].photoURL];
//    [photo loadImageWithURL:url];
    
    ;
    name.text = @"";
    tel.text = [NSString stringWithFormat:@"群組名稱:%@",_group.groupName];
    status.text = @"";

    
}

@end
