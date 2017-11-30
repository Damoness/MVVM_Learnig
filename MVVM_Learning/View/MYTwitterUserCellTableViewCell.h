//
//  MYTwitterUserCellTableViewCell.h
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/29.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTweetCellViewModel.h"
@interface MYTwitterUserCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *tweetAuthorAvatarImage;

@property (weak, nonatomic) IBOutlet UILabel *tweetContent;

@property (weak, nonatomic) IBOutlet UILabel *tweetAuthorFullName;

@property (nonatomic,strong) MyTweetCellViewModel *viewModel;



@end
