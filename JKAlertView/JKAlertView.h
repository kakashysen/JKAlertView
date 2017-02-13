//
//  CustomAlert.h
//  CustomAlertView
//
//  Created by Jose Aponte on 10/4/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKAlertView : UIView

@property(strong, nonatomic) UIColor *backgroundContentColor;
@property(strong, nonatomic) NSString *url;
@property(strong, nonatomic) NSString *linkText;
@property(strong, nonatomic) UIColor *linkTextColor;
@property(strong, nonatomic) NSString *titleText;
@property(strong, nonatomic) UIColor *titleTextColor;
@property(strong, nonatomic) NSString *detailText;
@property(strong, nonatomic) UIColor *detailTextColor;
@property(strong, nonatomic) NSString *footerText;
@property(strong, nonatomic) UIColor *footerTextColor;
@property(strong, nonatomic) UIImage *headerImage;

@property(strong, nonatomic) UIButton* linkButton;

-(instancetype)initWithFontName:(NSString*)fontName;

-(void)show;

@end
