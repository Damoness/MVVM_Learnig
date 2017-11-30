//
//  MYTwitterUserCellTableViewCell.m
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/29.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import "MYTwitterUserCellTableViewCell.h"
#import "ReactiveObjc.h"
@implementation MYTwitterUserCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    RAC(self.tweetAuthorAvatarImage,image) = RACObserve(self, viewModel.image);
    
    RAC(self.tweetContent,text) = RACObserve(self, viewModel.tweetContent);
    
    RAC(self.tweetAuthorFullName,text) = RACObserve(self, viewModel.tweetAuthorFullName);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
