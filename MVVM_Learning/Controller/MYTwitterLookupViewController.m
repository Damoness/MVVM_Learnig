//
//  ViewController.m
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import "MYTwitterLookupViewController.h"
#import "MYTwitterUserProfileViewController.h"
#import "MYTweetCellViewModel.h"
#import "MyLoadingTableViewCell.h"
#import "MYTwitterUserProfileViewModel.h"
#import "MYTwitterUserCellTableViewCell.h"
#import "ReactiveObjc.h"

# define DLog(fmt, ...) NSLog((@"[函数名:%s]" "[行号:%d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);

static  NSString *MYTwitterUserCellIdentifier =  @"MYTwitterUserCellIdentifier";
static  NSString *MYLoadingCellIdentifier  = @"MYLoadingCellIdentifier";


@interface MYTwitterLookupViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation MYTwitterLookupViewController


- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.viewModel = [[MYTwitterLookupViewModel alloc]init];
    
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyLoadingTableViewCell class]) bundle:nil] forCellReuseIdentifier:MYLoadingCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MYTwitterUserCellTableViewCell class]) bundle:nil] forCellReuseIdentifier:MYTwitterUserCellIdentifier];
    
    
    [[self.textField rac_textSignal]subscribeNext:^(NSString * _Nullable x) {
       
        
        DLog(@"x :%@ ",x);
        
    }];
    
    
    [[self.goButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
       
        DLog(@"x :%@ ",x);
        
    }];;
    
    [[[[UIAlertView alloc]init]rac_buttonClickedSignal]subscribeNext:^(NSNumber * _Nullable x) {
       
        
    }];
    
    [[self rac_signalForSelector:@selector(viewDidAppear:)]subscribeNext:^(RACTuple * _Nullable x) {
       
        
    }];;
    
    
    [[RACObserve(self.viewModel, usernameValid)map:^(NSNumber *  _Nullable value) {
        return [value stringValue];
    }]subscribeNext:^(id  _Nullable x) {
        
    }];;
    
    
     
    //RAC()你提供想要与即将到来的值绑定的对象和参数, 在其内部它所做的是创建一个订阅者并更新其属性的值.
    RAC(self.viewModel,  username) = [self.textField rac_textSignal];
    // RACObserve 会创建一个信号, 一旦它有了订阅者, 它就立刻发送那个属性的当前值, 并在发送那个属性在这之后的任何变化.
    RACSignal<NSNumber *> *usernameIsValidSignal = RACObserve(self. viewModel,  usernameValid);
    
    RAC(self.goButton ,alpha) = [usernameIsValidSignal map:^id _Nullable(NSNumber  *value) {
       
        return value.boolValue ? @1: @0.5;
    }];
    
    RAC(self.goButton, enabled) = usernameIsValidSignal;
    
    RAC(self.imageView, image) = RACObserve(self.viewModel, avatarImage);
    
    RAC(self.nameLabel,text) = RACObserve(self.viewModel, userFullName);
    
    
    @weakify(self);
    [[[RACSignal merge: @[RACObserve(self. viewModel,  tweets),
                          RACObserve(self. viewModel,  allTweetsLoaded)]]
      bufferWithTime: 0 onScheduler: [RACScheduler mainThreadScheduler]]
     subscribeNext: ^(id value) {
         @strongify(self);
         [self.tableView reloadData];
     }];

    
    //[RACSignal merge:@[]]bu;
    
    [[self.goButton rac_signalForControlEvents: UIControlEventTouchUpInside]
     subscribeNext:  ^(id value) {
         @strongify(self);
         [self.viewModel getTweetsForCurrentUsername];
     }];
    
}


- (instancetype) initWithViewModel:(MYTwitterLookupViewModel *)model{
    
    if (self = [super init]) {
        
        _viewModel = model;
    }
    return self;
}



- (void)didTapPrimaryUserAvatar{
    
    //http://www.sprynthesis.com/2014/12/06/reactivecocoa-mvvm-introduction/
    //http://www.cocoachina.com/ios/20150526/11930.html
    
    MYTwitterUserProfileViewModel  *userProfileViewModel = [self.viewModel viewModelForCurrentUser];
    MYTwitterUserProfileViewController *userProfileVC = [[MYTwitterUserProfileViewController alloc]init];
    userProfileVC.vieModel = userProfileViewModel;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0 ) {
        
        return self.viewModel.tweets.count;
        
    }else{
        
        if (self.viewModel.allTweetsLoaded) {
            return 0;
        }else{
            return 1;
        }
        
    }
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        MYTwitterUserCellTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MYTwitterUserCellIdentifier];
        cell.viewModel = self.viewModel.tweets[indexPath.row];
        
        return cell;
    }else{
        
        MyLoadingTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MYLoadingCellIdentifier];
        [self.viewModel loadMoreTweets];
        
        return cell;

    }
    
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

@end
