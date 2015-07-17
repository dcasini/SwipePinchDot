//
//  dotViewClass.m
//  SwipePinchDot
//
//  Created by David Casini on 4/4/15.
//  Copyright (c) 2015 Dave Casini. All rights reserved.
//

#import "dotViewClass.h"

@implementation dotViewClass

- (void)drawRect:(CGRect)rect {
        CGPoint center;
    center.x = rect.origin.x + rect.size.width / 2.0;
    center.y = rect.origin.y + rect.size.height / 2.0;
    
    float radius = rect.size.width / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI *2
                 clockwise:YES];
    
    [[UIColor redColor] setFill];
    
    [path fill];
}

@end
