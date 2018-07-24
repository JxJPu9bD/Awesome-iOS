//
//  CYNBaseTableViewCell.m
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017 JYW. All rights reserved.
//

#import "CYNBaseTableViewCell.h"
#import "CYNBaseTableDataModel.h"

@implementation CYNBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataModel:(__kindof CYNBaseTableDataModel *)dataModel {
    _dataModel = dataModel;
}

+ (CYNBaseTableViewCell *)cellWithFrame:(CGRect)frame owner:(id)owner {
    /*
    return [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class])
                                                          owner:owner
                                                        options:nil][0];
     */
    CYNBaseTableViewCell *cell = [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class])
                                                                                owner:owner
                                                                              options:nil][0];
    cell.frame = frame;
    return cell;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return self;
}


@end
