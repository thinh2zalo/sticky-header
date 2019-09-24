//
//  HeaderView.m
//  strickLyHeader
//
//  Created by Steve on 9/23/19.
//  Copyright © 2019 Steve. All rights reserved.
//

//
//  HeaderView.m
//  bacsicObjC
//
//  Created by CPU11606 on 9/13/19.
//  Copyright © 2019 CPU11606. All rights reserved.
//
#import "HeaderView.h"

@interface HeaderView()

@end

@implementation HeaderView
- (void)layoutSubviews {
    self.botHeaderView.frame = CGRectMake(0, 88, self.frame.size.width , 44);
    self.topHeaderView.frame = CGRectMake(0, 0, self.frame.size.width , HEADER_HEIGHT -  self.botHeaderView.frame.size.height);
    self.titleBotLab.frame = CGRectMake(10, 0, self.botHeaderView.frame.size.width, self.botHeaderView.frame.size.height);
    self.hideTitleTopView.frame = CGRectMake (0, 0 , self.frame.size.width, 44);
  
}

- (void) setHeightForBotHeader:(float) scrollDiff {
    self.botHeaderView.frame = CGRectMake(0, self.botHeaderView.frame.size.height - scrollDiff, self.frame.size.width , 44);
}

- (void) setHeightForTopHeader:(float) scrollDiff {
    self.titleTopLab.frame = CGRectMake(0, MIN(44, scrollDiff),  self.frame.size.width , 44);
}



- (UIView *)botHeaderView {
    
    if (!_botHeaderView) {
        _botHeaderView = UIView.new;
        
        
        [self addSubview:_botHeaderView];
    }
    return _botHeaderView;
}

- (UIView *)topHeaderView {
    
    if (!_topHeaderView) {
        _topHeaderView = UIView.new;
        _topHeaderView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_topHeaderView];
        
        
    }
    return _topHeaderView;
}


- (UIView *)hideTitleTopView  {
    if (!_hideTitleTopView) {
        _hideTitleTopView = UIView.new;
        
        _hideTitleTopView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_hideTitleTopView];
        
    }
    return _hideTitleTopView;
}

- (UILabel *)titleBotLab {
    if (!_titleBotLab) {
        _titleBotLab = UILabel.new;
        [_titleBotLab setFont:[UIFont boldSystemFontOfSize:44]];
        _titleBotLab.text = @"MESSAGE";
        [self.botHeaderView addSubview:_titleBotLab];
    }
    return  _titleBotLab;
}

- (UILabel *)titleTopLab {
    if (!_titleTopLab) {
        _titleTopLab = UILabel.new;
        [_titleTopLab setFont:[UIFont boldSystemFontOfSize:23]];
        _titleTopLab.textAlignment = NSTextAlignmentCenter;
        
        _titleTopLab.text = @"Message";
        [self.topHeaderView addSubview:_titleTopLab];
    }
    return  _titleTopLab;
}


@end

