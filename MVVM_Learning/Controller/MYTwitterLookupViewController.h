//
//  ViewController.h
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYTwitterLookupViewModel.h"

@interface MYTwitterLookupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField; //输入框
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;




@property (nonatomic,strong)MYTwitterLookupViewModel *viewModel;

- (instancetype) initWithViewModel:(MYTwitterLookupViewModel *)model;

@end

