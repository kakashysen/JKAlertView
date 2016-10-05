//
//  CustomAlert.m
//  CustomAlertView
//
//  Created by Jose Aponte on 10/4/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "JKAlertView.h"


#define FONT_SIZE_TITLE 18.f
#define FONT_SIZE_DETAIL 14.f
#define FONT_SIZE_LINK_BUTTON 16.f
#define FONT_SIZE_FOOTER 11.f

@interface JKAlertView()

@property(strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) UIView* contentView;
@property(strong, nonatomic) UIView* bottomLine;
@property(strong, nonatomic) UIButton* linkButton;
@property(strong, nonatomic) UILabel *titleLabel;
@property(strong, nonatomic) UILabel *footerLabel;
@property(strong, nonatomic) UILabel *detailLabel;
@property(strong, nonatomic) UIImageView *imageView;

@end


@implementation JKAlertView



-(instancetype)initWithFontName:(NSString*)fontName
{
    if (self = [super init])
    {
        _window = [UIApplication sharedApplication].keyWindow;
        
        if (!_window)
        {
            _window = [[UIApplication sharedApplication].windows objectAtIndex:0];
        }
        
        //Configure main view
        self.frame = _window.frame;
        self.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.8];
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        // Adding gesture recognizer for close
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        tapGesture.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGesture];
        
        // Configure content view
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 370)];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.center = self.center;
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _contentView.layer.cornerRadius = 8;
        _contentView.clipsToBounds = YES;
        [self addSubview:_contentView];
        
        // Added gesture recognizer to close view whith swip up and down gestures
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [_contentView addGestureRecognizer:pan];
        
        // Configure the header image view
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, 155)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [_contentView addSubview:_imageView];
        
        // Configure the title label
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,_imageView.frame.size.height + 10, _contentView.frame.size.width, 20)];
        _titleLabel.font = [UIFont fontWithName:fontName size:FONT_SIZE_TITLE];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = self.titleText;
        [_contentView addSubview:_titleLabel];
        
        // Configure the detail label
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _titleLabel.frame.origin.y + 35, _contentView.frame.size.width - 20, 60)];
        _detailLabel.font = [UIFont fontWithName:fontName size:FONT_SIZE_DETAIL];
        _detailLabel.numberOfLines = 0;
        _detailLabel.contentScaleFactor = 0.5;
        _detailLabel.lineBreakMode = NSLineBreakByClipping;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.text = self.detailText;
        [_contentView addSubview:_detailLabel];
        
        // Configure the footer label
        _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _contentView.frame.size.height - 30, _contentView.frame.size.width, 20)];
        _footerLabel.font = [UIFont fontWithName:fontName size:FONT_SIZE_FOOTER];
        _footerLabel.hidden = YES;
        _footerLabel.textAlignment = NSTextAlignmentCenter;
        _footerLabel.text = self.footerText;
        [_contentView addSubview:_footerLabel];
        
        // Configure the bottom line division
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, _footerLabel.frame.origin.y - (_footerLabel.frame.size.height - 10) , _contentView.frame.size.width, 1)];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
        _bottomLine.hidden = YES;
        [_contentView addSubview:_bottomLine];
        
        // Configure the link button
        float yLinkButtonPosition = _bottomLine.frame.origin.y - _detailLabel.frame.origin.y + _detailLabel.frame.size.height;
        _linkButton = [[UIButton alloc] initWithFrame:CGRectMake(0,yLinkButtonPosition, _contentView.frame.size.width, 30)];
        _linkButton.titleLabel.font = [UIFont fontWithName:fontName size:FONT_SIZE_LINK_BUTTON];
        _linkButton.hidden = YES;
        [_linkButton setTitle:self.linkText forState:UIControlStateNormal];
        [_linkButton setTitleColor:[UIColor colorWithRed:22.f/255.f green:134.f/255.f blue:255.f/255.f alpha:1.f] forState:UIControlStateNormal];
        [_linkButton addTarget:self action:@selector(actionLink:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_linkButton];
        
    }
    return self;
}


-(void)actionLink:(UIButton*) sender
{
    //    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.frame];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    //    [webView loadRequest:request];
    //    [self addSubview:webView];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];
}

-(void)tapGesture:(UITapGestureRecognizer*)gesture
{
    [UIView animateWithDuration:0.3/1.5 delay:0 options: UIViewAnimationOptionCurveLinear animations:^{
        _contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01f, 0.01f);
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self animateAlphaBackground];
        }
    }];
}

-(void)panGesture:(UIPanGestureRecognizer*)gesture
{
    CGPoint locationInView = [gesture translationInView:_contentView];
    if (gesture.state == UIGestureRecognizerStateChanged)
    {
        _contentView.center = CGPointMake(_contentView.center.x, _contentView.center.y + locationInView.y);
        [gesture setTranslation:CGPointZero inView:_contentView];
    }
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        CGFloat limit = 60;
        if (self.center.y - limit < _contentView.center.y && _contentView.center.y < self.center.y + limit)
        {
            [UIView animateWithDuration:0.3 animations:^{
                _contentView.center = self.center;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                // view slide down
                if (self.center.y - limit <= _contentView.center.y)
                {
                    _contentView.center = CGPointMake(_contentView.center.x, self.frame.size.height * 2);
                }
                else // view slide up
                {
                    _contentView.center = CGPointMake(_contentView.center.x, -self.frame.size.height);
                }
                
            } completion:^(BOOL finished) {
                if (finished)
                {
                    [self animateAlphaBackground];
                }
            }];
        }
    }
}

-(void)animateAlphaBackground
{
    [UIView animateWithDuration:0.2f/1.5 animations:^{
        self.alpha = 0.1f;
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self removeFromSuperview];
        }
    }];
}

-(void)show
{
    _contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
    self.alpha = 0.f;
    [_window.rootViewController.view addSubview:self];
    
    [UIView animateWithDuration:0.3f/1.5 animations:^{
        self.alpha = 1.f;
    }];
    
    
    [UIView animateWithDuration:0.3/1.5 delay:0 options: UIViewAnimationOptionCurveLinear animations:^{
        _contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _contentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _contentView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
}

#pragma mark - Setter methods
-(void)setBackgroundContentColor:(UIColor *)backgroundContentColor
{
    _backgroundContentColor = backgroundContentColor;
    _contentView.backgroundColor = _backgroundContentColor;
}

-(void)setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    _titleLabel.text = _titleText;
}

-(void)setTitleTextColor:(UIColor *)titleTextColor
{
    _titleTextColor = titleTextColor;
    _titleLabel.textColor = _titleTextColor;
}

-(void)setDetailText:(NSString *)detailText
{
    _detailText = detailText;
    _detailLabel.text = _detailText;
    [_detailLabel sizeToFit];
    _detailLabel.frame = CGRectMake(_contentView.bounds.size.width/2 - _detailLabel.frame.size.width/2, _detailLabel.frame.origin.y, _detailLabel.frame.size.width, _detailLabel.frame.size.height);
    
    float yLinkButtonPosition = (_bottomLine.frame.origin.y - (_detailLabel.frame.origin.y + _detailLabel.frame.size.height)) / 2 + (_detailLabel.frame.origin.y + _detailLabel.frame.size.height) -(_linkButton.frame.size.height / 2);
    _linkButton.frame = CGRectMake(_linkButton.frame.origin.x,yLinkButtonPosition, _contentView.frame.size.width, _linkButton.frame.size.height);
}

-(void)setDetailTextColor:(UIColor *)detailTextColor
{
    _detailTextColor = detailTextColor;
    _detailLabel.textColor = _detailTextColor;
}

-(void)setLinkText:(NSString *)linkText
{
    _linkText = linkText;
    _linkButton.hidden = (linkText && linkText.length > 0)? NO : YES;
    [_linkButton setTitle:_linkText forState:UIControlStateNormal];
}

-(void)setLinkTextColor:(UIColor *)linkTextColor
{
    _linkTextColor = linkTextColor;
    [_linkButton setTitleColor:_linkTextColor forState:UIControlStateNormal];
}

-(void)setFooterText:(NSString *)footerText
{
    _footerText = footerText;
    BOOL hidden = (footerText && footerText.length > 0) ? NO : YES;
    _footerLabel.hidden = hidden;
    _bottomLine.hidden = hidden;
    _footerLabel.text = _footerText;
}

-(void)setFooterTextColor:(UIColor *)footerTextColor
{
    _footerTextColor = footerTextColor;
    _footerLabel.textColor = _footerTextColor;
}

-(void)setHeaderImage:(UIImage *)headerImage
{
    _headerImage = headerImage;
    _imageView.image = _headerImage;
}



@end
