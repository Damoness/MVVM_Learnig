//
//  MYTwitterLookupViewModel.m
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import "MYTwitterLookupViewModel.h"
#import "MYTwitterUserProfileViewModel.h"
#import "MyTweetCellViewModel.h"

@interface MYTwitterLookupViewModel()


@property (nonatomic,assign,readwrite,getter=isUsernameValid) BOOL usernameValid;

@property (nonatomic,strong,readwrite) UIImage *avatarImage;

@property (nonatomic,strong,readwrite) NSString *userFullName;

@property (nonatomic,assign, readwrite) BOOL allTweetsLoaded;

@property (nonatomic,strong,readwrite) NSArray *tweets; //

@end

@implementation MYTwitterLookupViewModel



- (instancetype)init
{
    self = [super init];
    if (self) {
    
        //初始化
        _allTweetsLoaded = YES;

    
    }
    return self;
}


- (void)setUsername:(NSString *)username{

    _username = username;
    
    if (username !=nil && ![username isEqualToString:@""]) {

        self.usernameValid = YES;
        
    }else{
        self.usernameValid = NO;
    }
    
}


- (void)getTweetsForCurrentUsername{
    
    if ([self.username isEqualToString:@"Damoness"]) {
        
        
        self.userFullName = @"Damoness Wu";
        
        self.avatarImage = [UIImage imageNamed:@"1"];
        
        self.tweets = @[
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"David" content:@"David的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Lily" content:@"Lily的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Hane" content:@"Hane的内容" image:[UIImage imageNamed:@"1"]],
                            ];
        
        
        self.allTweetsLoaded = NO;
    }
    
}

- (void)loadMoreTweets{
    
    //加载更多的数据
    
    if (!self.allTweetsLoaded) {
        //获取更多数据增加到self.tweets上.
        
      
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
            sleep(3);
            
            self.tweets =  [self.tweets arrayByAddingObjectsFromArray:@[
                                                                        [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Woody" content:@"新增的更多内容" image:[UIImage imageNamed:@"1"]],
                                                                        [[MyTweetCellViewModel alloc]initWithTweetAuthorFullName:@"Woody" content:@"新增的更多内容" image:[UIImage imageNamed:@"1"]],
                                                                        ]];
            
            self.allTweetsLoaded = YES;
            
        });
        

    }
    
    
}

- (MYTwitterUserProfileViewModel *)viewModelForCurrentUser{
    
    
    return [[MYTwitterUserProfileViewModel alloc]init];
    
}



@end

