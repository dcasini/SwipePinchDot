//
//  ViewController.m
//  SwipePinchDot
//
//  Created by David Casini on 4/4/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "ViewController.h"
#import "dotViewClass.h"

@interface ViewController ()  <UIGestureRecognizerDelegate>

@property dotViewClass *firstDot;

@property (nonatomic,strong)UISwipeGestureRecognizer *swipeRight;

@property (nonatomic,strong)UISwipeGestureRecognizer *swipeLeft;

@property (nonatomic,strong)UISwipeGestureRecognizer *swipeUp;

@property (nonatomic,strong)UISwipeGestureRecognizer *swipeDown;

@property (nonatomic,strong)UIPinchGestureRecognizer *pinchDetected;

@property UILabel *swipeLabel;

@property UILabel *pinchLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect firstRect = CGRectMake(0,0, 100, 100);
    self.firstDot = [[dotViewClass alloc]initWithFrame:firstRect];
    _firstDot.backgroundColor = [UIColor clearColor];
    CGPoint centerInScreen;
    centerInScreen.x = self.view.center.x;
    centerInScreen.y = self.view.center.y;
    self.firstDot.center = centerInScreen;
    [self.view addSubview:_firstDot];
   
    _swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                           action:@selector(moveDotRight:)];
    _swipeRight.direction = UISwipeGestureRecognizerDirectionRight;   //defining even though this is default
    [self.view addGestureRecognizer:_swipeRight];
    
    _swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                           action:@selector(moveDotLeft:)];
    _swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:_swipeLeft];
    
    _swipeUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                           action:@selector(moveDotUp:)];
    _swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:_swipeUp];
    
    _swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                           action:@selector(moveDotDown:)];
    _swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:_swipeDown];
    
    _pinchDetected = [[UIPinchGestureRecognizer alloc]initWithTarget:self
                                                              action:@selector(pinchDot:)];
    [self.view addGestureRecognizer:_pinchDetected];
    
    [self addLabel];
}

- (void)addLabel
{
    CGRect frame1 = CGRectMake(40, 40, self.view.frame.size.width, 20);
    self.swipeLabel = [[UILabel alloc]initWithFrame:frame1];
    _swipeLabel.text = @"swipe to move dot";
    [self.view addSubview:_swipeLabel];
    
    CGRect frame2 = CGRectMake(60, 60, self.view.frame.size.width, 20);
    _pinchLabel = [[UILabel alloc]initWithFrame:frame2];
    _pinchLabel.text = @"pinch to change size";
    [self.view addSubview:_pinchLabel];
}

- (void)pinchDot:(UIGestureRecognizer *)gr
{
    CGPoint currentCenter = _firstDot.center;
    float currentWidth = _firstDot.frame.size.width;
    float newWidth = (currentWidth * _pinchDetected.scale);
    float newHeight = newWidth;
    
    if (newWidth > self.view.frame.size.height){
        newWidth = self.view.frame.size.height;
    }
    if (newHeight > self.view.frame.size.height){
        newHeight = self.view.frame.size.height;
    }
    if (newWidth < 10){
        newWidth = 10;
    }
    if (newHeight < 10){
        newHeight = 10;
    }
    
    CGRect newFrame = CGRectMake(0, 0, newWidth, newHeight);
    
    _firstDot.frame = newFrame;
    _firstDot.center = currentCenter;
    
    [_pinchLabel removeFromSuperview];
}



- (void)moveDotRight:(UIGestureRecognizer *)gr
{
    CGPoint newLocation;
    newLocation.x = (_firstDot.center.x + 50);
    newLocation.y = _firstDot.center.y;
    
    if (newLocation.x > (self.view.frame.size.width +40)) {
        newLocation.x = -40;
    }
    self.firstDot.center = newLocation;
    
    [_swipeLabel removeFromSuperview];
}

- (void)moveDotLeft:(UIGestureRecognizer *)gr
{
    CGPoint newLocation;
    newLocation.x = (_firstDot.center.x - 50);
    newLocation.y = _firstDot.center.y;
    
    if (newLocation.x < (-40)) {
        newLocation.x = (self.view.frame.size.width + 40);
    }
    self.firstDot.center = newLocation;
    
    [_swipeLabel removeFromSuperview];
}

- (void)moveDotDown:(UIGestureRecognizer *)gr
{
    CGPoint newLocation;
    newLocation.y = (_firstDot.center.y + 50);
    newLocation.x = _firstDot.center.x;
    
    if (newLocation.y > (self.view.frame.size.height +40)) {
        newLocation.y = -40;
    }
    self.firstDot.center = newLocation;
    
    [_swipeLabel removeFromSuperview];
}

- (void)moveDotUp:(UIGestureRecognizer *)gr
{
    CGPoint newLocation;
    newLocation.y = (_firstDot.center.y - 50);
    newLocation.x = _firstDot.center.x;
    
    if (newLocation.y < (-40))
        newLocation.y =  (self.view.frame.size.height +40);
    self.firstDot.center = newLocation;
    
    [_swipeLabel removeFromSuperview];
}

@end
 
 

