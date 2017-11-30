//
//  MyTweetCellViewModel.h
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyTweetCellViewModel : NSObject

@property (nonatomic,strong,readonly) NSString *tweetAuthorFullName;

@property (nonatomic,strong,readonly) NSString *tweetContent;

@property (nonatomic,strong,readonly) UIImage *image;


-(instancetype)initWithTweetAuthorFullName:(NSString *)name
                                   content:(NSString *)content
                                     image:(UIImage *)image;


@end
