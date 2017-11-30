//
//  MYTwitterLookupViewModel.h
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MYTwitterUserProfileViewModel.h"
@interface MYTwitterLookupViewModel : NSObject


@property (nonatomic,strong,readonly) UIImage *avatarImage;

@property (nonatomic,strong,readonly) NSString *userFullName;

@property (nonatomic,assign,readonly,getter=isUsernameValid) BOOL usernameValid;

@property (nonatomic, assign, readonly) BOOL allTweetsLoaded;

@property (nonatomic,strong,readwrite) NSString *username;

@property (nonatomic,strong,readonly) NSArray *tweets; //

- (void)getTweetsForCurrentUsername; //获取当前用户名的tweets;

- (void)loadMoreTweets; //加载更多tweets;

- (MYTwitterUserProfileViewModel *)viewModelForCurrentUser;

@end
