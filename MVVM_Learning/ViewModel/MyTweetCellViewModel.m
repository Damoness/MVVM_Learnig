//
//  MyTweetCellViewModel.m
//  MVVM_Learning
//
//  Created by Damoness on 2017/11/28.
//  Copyright © 2017年 SharePlus. All rights reserved.
//

#import "MyTweetCellViewModel.h"

@implementation MyTweetCellViewModel



-(instancetype)initWithTweetAuthorFullName:(NSString *)name
                                   content:(NSString *)content
                                     image:(UIImage *)image{
    
    
    if (self = [super init]) {
        _tweetAuthorFullName = name;
        _tweetContent = content;
        _image = image;
    }
    
    return self;
    
}

@end
