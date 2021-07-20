//
//  CurveView.m
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 19.07.21.
//

#import "CurveView.h"

@implementation CurveView

NSMutableArray* colorsArr;
int currentPaint = -1;

int currentStep;
int endStep;

NSArray* p111;
NSArray* p112;
NSArray* p113;
NSArray* p121;
NSArray* p122;
NSArray* p123;
NSArray* p131;
NSArray* p132;
NSArray* p133;

NSArray* p211;
NSArray* p221;
NSArray* p231;

NSArray* p311;
NSArray* p321;
NSArray* p331;

NSArray* p411;
NSArray* p421;
NSArray* p431;

- (UIImage *)captureView {
    CGRect rect = [self bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[self layer] renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(void)start:(float)t clrs:(NSMutableArray*)clrs pos:(int)pos {
    colorsArr = clrs;
    currentPaint = pos;
    currentStep = 0;
    endStep = 60 * t;
    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        currentStep += 1;
        if (currentStep >= endStep) {
            [timer invalidate];
        }
        [self setNeedsDisplay];
    }];
}

- (void)drawRect:(CGRect)rect {
    if (currentPaint == 0) {
        [self drawPlanet];
    } else if (currentPaint == 1) {
        [self drawHead];
    } else if (currentPaint == 2) {
        [self drawTree];
    } else if (currentPaint == 3) {
        [self drawLandscape];
    }
}

-(void)drawTree {
    
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path1 moveToPoint: CGPointMake(233.19, 85.76)];
    [path2 moveToPoint: CGPointMake(102, 270.5)];
    [path3 moveToPoint: CGPointMake(119.5, 263.5)];
    [colorsArr[0] setStroke];
    for (int i = 0; i < (int)(([p111 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path1 addCurveToPoint:[p111[i] CGPointValue] controlPoint1:[p112[i] CGPointValue] controlPoint2:[p113[i] CGPointValue]];
    }
    [path1 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path1 setLineWidth:1];
    [path1 stroke];
    [colorsArr[1] setStroke];
    for (int i = 0; i < (int)(([p121 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path2 addCurveToPoint:[p121[i] CGPointValue] controlPoint1:[p122[i] CGPointValue] controlPoint2:[p123[i] CGPointValue]];
    }
    [path2 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path2 setLineWidth:1];
    [path2 stroke];
    [colorsArr[2] setStroke];
    for (int i = 0; i < (int)(([p131 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path3 addCurveToPoint:[p131[i] CGPointValue] controlPoint1:[p132[i] CGPointValue] controlPoint2:[p133[i] CGPointValue]];
    }
    [path3 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path3 setLineWidth:1];
    [path3 stroke];
}

-(void)drawHead {
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path1 moveToPoint: CGPointMake(209.5, 122.5)];
    [path2 moveToPoint: CGPointMake(204, 120)];
    [path3 moveToPoint: CGPointMake(81.5, 49)];
    [colorsArr[0] setStroke];
    for (int i = 0; i < (int)(([p211 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path1 addLineToPoint: [p211[i] CGPointValue]];
    }
    [path1 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path1 setLineWidth:1];
    [path1 stroke];
    [colorsArr[1] setStroke];
    for (int i = 0; i < (int)(([p221 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path2 addLineToPoint: [p221[i] CGPointValue]];
    }
    [path2 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path2 setLineWidth:1];
    [path2 stroke];
    [colorsArr[2] setStroke];
    for (int i = 0; i < (int)(([p231 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path3 addLineToPoint: [p231[i] CGPointValue]];
    }
    [path3 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path3 setLineWidth:1];
    [path3 stroke];
}

-(void)drawLandscape {
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path1 moveToPoint: CGPointMake(123.5, 173)];
    [path2 moveToPoint: CGPointMake(55.5, 233.5)];
    [path3 moveToPoint: CGPointMake(269, 154)];
    [colorsArr[0] setStroke];
    for (int i = 0; i < (int)(([p311 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path1 addLineToPoint: [p311[i] CGPointValue]];
    }
    [path1 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path1 setLineWidth:1];
    [path1 stroke];
    [colorsArr[1] setStroke];
    for (int i = 0; i < (int)(([p321 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path2 addLineToPoint: [p321[i] CGPointValue]];
    }
    [path2 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path2 setLineWidth:1];
    [path2 stroke];
    [colorsArr[2] setStroke];
    for (int i = 0; i < (int)(([p331 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path3 addLineToPoint: [p331[i] CGPointValue]];
    }
    [path3 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path3 setLineWidth:1];
    [path3 stroke];
}

-(void)drawPlanet {
    UIColor *blueColor = [UIColor blueColor];
    [blueColor setStroke];
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    UIBezierPath *path3 = [[UIBezierPath alloc] init];
    [path1 moveToPoint: CGPointMake(176, 134.5)];
    [path2 moveToPoint: CGPointMake(80.5, 174)];
    [path3 moveToPoint: CGPointMake(237, 71)];
    [colorsArr[0] setStroke];
    for (int i = 0; i < (int)(([p411 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path1 addLineToPoint: [p411[i] CGPointValue]];
    }
    [path1 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path1 setLineWidth:1];
    [path1 stroke];
    [colorsArr[1] setStroke];
    for (int i = 0; i < (int)(([p421 count]) * ((float)currentStep / (float)endStep)); i++) {
        [path2 addLineToPoint: [p421[i] CGPointValue]];
    }
    [path2 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path2 setLineWidth:1];
    [path2 stroke];
    [colorsArr[2] setStroke];
    for (int i = 0; i < (int)(([p431 count]) * ((float)currentStep / (float)endStep)); i++) {
        if (i % 8) {
            [path3 addLineToPoint: [p431[i] CGPointValue]];
        } else {
            [path3 moveToPoint: [p431[i] CGPointValue]];
        }
    }
    [path3 applyTransform:CGAffineTransformMakeTranslation(-20, -20)];
    [path3 setLineWidth:1];
    [path3 stroke];
}

-(void)prepare {
    p111 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(237, 76.5)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(220.5, 62)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(215.97, 62.55)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(199.5, 49)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(191.6, 50.77)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(180.5, 47)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(175.97, 47.55)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(159.5, 34)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(145.59, 40.7)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(140.5, 40)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(130.81, 42.77)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(125.5, 42)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(111.59, 48.7)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(106.5, 48)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(90, 62.5)       ],
                                      [NSValue valueWithCGPoint: CGPointMake(90.01, 63.02)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(88.59, 64.7)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(83.5, 64)       ],
                                      [NSValue valueWithCGPoint: CGPointMake(67, 78.5)       ],
                                      [NSValue valueWithCGPoint: CGPointMake(68.58, 84.71)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(66, 92.5)       ],
                                      [NSValue valueWithCGPoint: CGPointMake(67.19, 97.92)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(64, 106.5)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(65.58, 112.71)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(63, 120.5)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(79.5, 135)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(81.68, 134.88)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(96.5, 143)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(104.35, 141.26) ],
                                      [NSValue valueWithCGPoint: CGPointMake(119.5, 150)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(121.68, 149.88) ],
                                      [NSValue valueWithCGPoint: CGPointMake(136.5, 158)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(145, 155.93)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(149.66, 157.6)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(162.5, 163)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(170.35, 161.26) ],
                                      [NSValue valueWithCGPoint: CGPointMake(185.5, 170)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(187.68, 169.88) ],
                                      [NSValue valueWithCGPoint: CGPointMake(202.5, 178)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(211, 175.93)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(219.5, 178)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(236, 163.5)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(235.99, 162.99) ],
                                      [NSValue valueWithCGPoint: CGPointMake(236.5, 163)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(245, 160.93)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(253.5, 163)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(270, 148.5)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(269.66, 145.56) ],
                                      [NSValue valueWithCGPoint: CGPointMake(277, 133.5)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(273.19, 124.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(280, 112.5)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(263.5, 98)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(258.96, 98.55)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(242.5, 85)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(234.6, 86.77)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(233.19, 85.76)  ], nil];
    
    p112 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(235.57, 83.25)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(237, 68.49)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(218.93, 62)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(215.41, 54.99)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(196.64, 49)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(188.67, 48.43)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(178.93, 47)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(175.41, 39.99)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(153.65, 34)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(143.98, 40.25)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(136.88, 40)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(129.14, 42.27)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(119.65, 42)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(109.98, 48.25)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(97.39, 48)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(90, 62.68)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(89.49, 63.55)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(86.98, 64.25)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(74.39, 64)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(67, 80.72)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(66.95, 86.96)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(66, 94.42)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(65.19, 100.33)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(64, 108.72)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(63.95, 114.96)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(63, 128.51)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(80.24, 135)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(84.36, 139.69)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(99.34, 143)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(106.89, 146.4)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(120.24, 150)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(124.36, 154.69) ],
                                      [NSValue valueWithCGPoint: CGPointMake(139.61, 158)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(146.43, 156.69) ],
                                      [NSValue valueWithCGPoint: CGPointMake(152.68, 160.9)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(165.34, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(172.89, 166.4)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(186.24, 170)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(190.36, 174.69) ],
                                      [NSValue valueWithCGPoint: CGPointMake(205.61, 178)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(213.48, 177.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(228.61, 178)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(236, 163.33)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(236.16, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(239.61, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(247.48, 162.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(262.61, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(270, 147.49)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(274.09, 142.96) ],
                                      [NSValue valueWithCGPoint: CGPointMake(277, 129.98)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(277.32, 121.6)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(280, 104.49)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(261.93, 98)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(258.41, 90.99)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(239.64, 85)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(234.15, 86.41)  ], nil];
    
    p113 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(237, 80.02)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(229.61, 62)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(217.41, 62.19)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(208.25, 49)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(193.94, 49.64)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(184.77, 47)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(177.41, 47.19)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(168.25, 34)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(148.52, 36.67)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(142.28, 40)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(133.53, 41.03)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(127.36, 42)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(114.52, 44.67)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(108.28, 48)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(90, 54.49)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(90, 62.85)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(89.02, 64.11)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(85.28, 64)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(67, 70.49)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(67.57, 82.83)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(66, 89.63)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(66.42, 96.25)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(64, 103.29)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(64.57, 110.83)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(63, 117.63)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(70.39, 135)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(80.96, 134.96)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(89.99, 143)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(102.02, 142.37) ],
                                      [NSValue valueWithCGPoint: CGPointMake(112.72, 150)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(120.96, 149.96) ],
                                      [NSValue valueWithCGPoint: CGPointMake(129.99, 158)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(142.52, 157.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(147.99, 157.26) ],
                                      [NSValue valueWithCGPoint: CGPointMake(157.31, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(168.02, 162.37) ],
                                      [NSValue valueWithCGPoint: CGPointMake(178.72, 170)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(186.96, 169.96) ],
                                      [NSValue valueWithCGPoint: CGPointMake(195.99, 178)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(208.52, 177.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(216.39, 178)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(236, 171.51)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(236, 163.16)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(236.33, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(242.52, 162.24) ],
                                      [NSValue valueWithCGPoint: CGPointMake(250.39, 163)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(270, 156.51)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(269.88, 146.51) ],
                                      [NSValue valueWithCGPoint: CGPointMake(277, 138.53)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(275.57, 126.75) ],
                                      [NSValue valueWithCGPoint: CGPointMake(280, 117.33)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(272.61, 98)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(260.41, 98.19)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(251.25, 85)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(236.94, 85.64)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(233.68, 86.08)  ], nil];
    
    p121 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(163.5, 207.5) ],
                                      [NSValue valueWithCGPoint: CGPointMake(153.5, 160.5) ],
                                      [NSValue valueWithCGPoint: CGPointMake(192, 247)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(203, 188.5)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(212.5, 176.5) ],
                                      [NSValue valueWithCGPoint: CGPointMake(171, 234)     ],
                                      [NSValue valueWithCGPoint: CGPointMake(188.5, 188.5) ],
                                      [NSValue valueWithCGPoint: CGPointMake(144.5, 256.5) ], nil];
    
    p122 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(121.83, 264.67) ],
                                      [NSValue valueWithCGPoint: CGPointMake(165.1, 171.1)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(227.17, 275)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(193.2, 226.2)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(205.17, 184.17) ],
                                      [NSValue valueWithCGPoint: CGPointMake(177, 200.17)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(183.5, 251.5)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(152, 246.5)     ], nil];
    
    p123 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(161.9, 243.9) ],
                                      [NSValue valueWithCGPoint: CGPointMake(157.5, 161)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(190.8, 267.8) ],
                                      [NSValue valueWithCGPoint: CGPointMake(199.83,199.33)],
                                      [NSValue valueWithCGPoint: CGPointMake(210.1, 175.7) ],
                                      [NSValue valueWithCGPoint: CGPointMake(173.4, 231.2) ],
                                      [NSValue valueWithCGPoint: CGPointMake(182.5, 203)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(150.5, 251)   ], nil];
    
    p131 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(86, 268.81)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(83.5, 268)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(94, 272)      ],
                                      [NSValue valueWithCGPoint: CGPointMake(221.5, 260.5) ],
                                      [NSValue valueWithCGPoint: CGPointMake(226.74, 266.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(226.74, 266.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(261.5, 268)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(244.5, 276)   ], nil];
    
    p132 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(111.5, 255)    ],
                                      [NSValue valueWithCGPoint: CGPointMake(62.83, 271.17) ],
                                      [NSValue valueWithCGPoint: CGPointMake(94.7, 271.6)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(203, 257.73)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(223.78, 262.73)],
                                      [NSValue valueWithCGPoint: CGPointMake(230, 272.46)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(238.33, 263.33)],
                                      [NSValue valueWithCGPoint: CGPointMake(261.5, 276.8)  ], nil];
    
    p133 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(96.4, 255.61)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(72.3, 264.4)   ],
                                      [NSValue valueWithCGPoint: CGPointMake(95.17, 272.17) ],
                                      [NSValue valueWithCGPoint: CGPointMake(214.7, 253.85) ],
                                      [NSValue valueWithCGPoint: CGPointMake(225.48, 264.74)],
                                      [NSValue valueWithCGPoint: CGPointMake(229.25, 269.99)],
                                      [NSValue valueWithCGPoint: CGPointMake(261.5, 259.2)  ],
                                      [NSValue valueWithCGPoint: CGPointMake(245.83, 275.17)], nil];
    
    // -----------------------------------------------------------------------------------------------------------------
    
    p211 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(214, 128.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(216.5, 135)],
                                      [NSValue valueWithCGPoint: CGPointMake(213, 144)],
                                      [NSValue valueWithCGPoint: CGPointMake(206, 152.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(197, 159.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(187.5, 152.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(177, 148.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(167.5, 148.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(155.5, 152.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(147.5, 162)],
                                      [NSValue valueWithCGPoint: CGPointMake(141, 174.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(129.5, 167.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(121.5, 157.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(113, 148.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(113, 162)],
                                      [NSValue valueWithCGPoint: CGPointMake(113, 190.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(113, 207.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(106, 219)],
                                      [NSValue valueWithCGPoint: CGPointMake(94.5, 227.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(83.5, 234.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(101, 241)],
                                      [NSValue valueWithCGPoint: CGPointMake(114.5, 249.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(125, 263.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(139, 281)],
                                      [NSValue valueWithCGPoint: CGPointMake(158, 299)],
                                      [NSValue valueWithCGPoint: CGPointMake(177, 305.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(191, 305.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(206, 297.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(219.5, 281)],
                                      [NSValue valueWithCGPoint: CGPointMake(229.5, 259.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(239, 243.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(253.5, 237)],
                                      [NSValue valueWithCGPoint: CGPointMake(257, 237)],
                                      [NSValue valueWithCGPoint: CGPointMake(250.5, 221.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(241, 193)],
                                      [NSValue valueWithCGPoint: CGPointMake(239, 170)],
                                      [NSValue valueWithCGPoint: CGPointMake(239, 146.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(232, 157.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(224, 165.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(216.5, 174.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(200, 190.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(190, 205)],
                                      [NSValue valueWithCGPoint: CGPointMake(181.5, 226.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(178.5, 252.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(178.5, 281)],
                                      [NSValue valueWithCGPoint: CGPointMake(178.5, 299)], nil];
    
    p221 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(195.5, 118.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(186, 120.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(178, 121.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(168.5, 120.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(160, 119)],
                                      [NSValue valueWithCGPoint: CGPointMake(153.5, 118.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(146, 120)],
                                      [NSValue valueWithCGPoint: CGPointMake(141.5, 122)],
                                      [NSValue valueWithCGPoint: CGPointMake(147.5, 124.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(152, 128)],
                                      [NSValue valueWithCGPoint: CGPointMake(156.5, 133)],
                                      [NSValue valueWithCGPoint: CGPointMake(162.5, 135.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(170, 136.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(177, 135.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(184.5, 136.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(190.5, 135.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(197, 131.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(204, 123.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(208.5, 117.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(200.5, 116.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(191.5, 115.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(182.5, 113.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(174, 113)],
                                      [NSValue valueWithCGPoint: CGPointMake(164, 114.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(155, 116.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(145, 117.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(138, 117)],
                                      [NSValue valueWithCGPoint: CGPointMake(147.5, 111)],
                                      [NSValue valueWithCGPoint: CGPointMake(156.5, 104.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(162.5, 101)],
                                      [NSValue valueWithCGPoint: CGPointMake(167.5, 102.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(173, 104.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(179.5, 103.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(186, 102.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(191.5, 102.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(194.5, 104.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(199.5, 109.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(207, 114)], nil];
    
    p231 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(97, 109)],
                                      [NSValue valueWithCGPoint: CGPointMake(109, 132)],
                                      [NSValue valueWithCGPoint: CGPointMake(126.5, 151.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(153.5, 174)],
                                      [NSValue valueWithCGPoint: CGPointMake(177, 179.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(213, 162)],
                                      [NSValue valueWithCGPoint: CGPointMake(240, 132)],
                                      [NSValue valueWithCGPoint: CGPointMake(248.5, 120)],
                                      [NSValue valueWithCGPoint: CGPointMake(248.5, 97.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(250.5, 70.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(238.5, 60.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(222, 63.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(211, 80.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(209, 103.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(213, 116)], nil];
    
    // -----------------------------------------------------------------------------------------------------------------
    
    p311 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(125.5, 179.5)],
            [NSValue valueWithCGPoint: CGPointMake(126.5, 190.5)],
            [NSValue valueWithCGPoint: CGPointMake(124, 209)],
            [NSValue valueWithCGPoint: CGPointMake(120.5, 226.5)],
            [NSValue valueWithCGPoint: CGPointMake(121, 236)],
            [NSValue valueWithCGPoint: CGPointMake(124, 244)],
            [NSValue valueWithCGPoint: CGPointMake(129.5, 232.5)],
            [NSValue valueWithCGPoint: CGPointMake(129.5, 216.5)],
            [NSValue valueWithCGPoint: CGPointMake(128.5, 208.5)],
            [NSValue valueWithCGPoint: CGPointMake(127.5, 201)],
            [NSValue valueWithCGPoint: CGPointMake(138, 203.5)],
            [NSValue valueWithCGPoint: CGPointMake(139.5, 214)],
            [NSValue valueWithCGPoint: CGPointMake(141.5, 210.5)],
            [NSValue valueWithCGPoint: CGPointMake(144, 219.5)],
            [NSValue valueWithCGPoint: CGPointMake(146.5, 225.5)],
            [NSValue valueWithCGPoint: CGPointMake(145.5, 218.5)],
            [NSValue valueWithCGPoint: CGPointMake(149, 224.5)],
            [NSValue valueWithCGPoint: CGPointMake(159, 209)],
            [NSValue valueWithCGPoint: CGPointMake(160.5, 216)],
            [NSValue valueWithCGPoint: CGPointMake(163, 221.5)],
            [NSValue valueWithCGPoint: CGPointMake(163.5, 217)],
            [NSValue valueWithCGPoint: CGPointMake(162, 212)],
            [NSValue valueWithCGPoint: CGPointMake(161.5, 207)],
            [NSValue valueWithCGPoint: CGPointMake(157, 210)],
            [NSValue valueWithCGPoint: CGPointMake(156, 204)],
            [NSValue valueWithCGPoint: CGPointMake(155.5, 196)],
            [NSValue valueWithCGPoint: CGPointMake(156, 189)],
            [NSValue valueWithCGPoint: CGPointMake(96.5, 186)],
            [NSValue valueWithCGPoint: CGPointMake(95.5, 193)],
            [NSValue valueWithCGPoint: CGPointMake(95.5, 201)],
            [NSValue valueWithCGPoint: CGPointMake(94, 187.5)],
            [NSValue valueWithCGPoint: CGPointMake(96.5, 178.5)],
            [NSValue valueWithCGPoint: CGPointMake(100, 171)],
            [NSValue valueWithCGPoint: CGPointMake(98.5, 166)],
            [NSValue valueWithCGPoint: CGPointMake(95.5, 172)],
            [NSValue valueWithCGPoint: CGPointMake(56.5, 209)],
            [NSValue valueWithCGPoint: CGPointMake(53.5, 216.5)],
            [NSValue valueWithCGPoint: CGPointMake(50.5, 222)],
            [NSValue valueWithCGPoint: CGPointMake(59.5, 208.5)],
            [NSValue valueWithCGPoint: CGPointMake(56, 217.5)],
            [NSValue valueWithCGPoint: CGPointMake(62, 198.5)],
            [NSValue valueWithCGPoint: CGPointMake(74, 189)],
            [NSValue valueWithCGPoint: CGPointMake(74, 198.5)],
            [NSValue valueWithCGPoint: CGPointMake(73.5, 206)],
            [NSValue valueWithCGPoint: CGPointMake(71.5, 204)],
            [NSValue valueWithCGPoint: CGPointMake(83, 213)],
            [NSValue valueWithCGPoint: CGPointMake(84.5, 228.5)],
            [NSValue valueWithCGPoint: CGPointMake(100.5, 205.5)],
            [NSValue valueWithCGPoint: CGPointMake(101.5, 214)],
            [NSValue valueWithCGPoint: CGPointMake(212, 165.5)],
            [NSValue valueWithCGPoint: CGPointMake(214.5, 172)],
            [NSValue valueWithCGPoint: CGPointMake(215.04, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(216, 179)],
            [NSValue valueWithCGPoint: CGPointMake(215.04, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(215.5, 166.5)],
            [NSValue valueWithCGPoint: CGPointMake(215.04, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(225.5, 161)],
            [NSValue valueWithCGPoint: CGPointMake(223.5, 168.5)],
            [NSValue valueWithCGPoint: CGPointMake(247.5, 173.5)],
            [NSValue valueWithCGPoint: CGPointMake(253.5, 186.5)],
            [NSValue valueWithCGPoint: CGPointMake(230, 216)],
            [NSValue valueWithCGPoint: CGPointMake(235, 221.5)],
            [NSValue valueWithCGPoint: CGPointMake(218, 218.5)],
            [NSValue valueWithCGPoint: CGPointMake(273.5, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(278, 178.5)],
            [NSValue valueWithCGPoint: CGPointMake(280.5, 182.5)],
            [NSValue valueWithCGPoint: CGPointMake(141.5, 165.5)],
            [NSValue valueWithCGPoint: CGPointMake(146.5, 168.5)],
            [NSValue valueWithCGPoint: CGPointMake(149, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(241, 140)],
            [NSValue valueWithCGPoint: CGPointMake(241, 144)],
            [NSValue valueWithCGPoint: CGPointMake(233.5, 152.5)],
            [NSValue valueWithCGPoint: CGPointMake(246, 217.5)],
            [NSValue valueWithCGPoint: CGPointMake(251, 219.5)],
            [NSValue valueWithCGPoint: CGPointMake(259.5, 226.5)],
            [NSValue valueWithCGPoint: CGPointMake(182, 201)],
            [NSValue valueWithCGPoint: CGPointMake(188.5, 208.5)], nil];
    
    p321 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(70, 233.5)],
            [NSValue valueWithCGPoint: CGPointMake(84, 230)],
            [NSValue valueWithCGPoint: CGPointMake(101.5, 220.5)],
            [NSValue valueWithCGPoint: CGPointMake(118.5, 215.5)],
            [NSValue valueWithCGPoint: CGPointMake(134.5, 222)],
            [NSValue valueWithCGPoint: CGPointMake(147.25, 227.75)],
            [NSValue valueWithCGPoint: CGPointMake(147.25, 227.75)],
            [NSValue valueWithCGPoint: CGPointMake(160, 224)],
            [NSValue valueWithCGPoint: CGPointMake(170, 225.5)],
            [NSValue valueWithCGPoint: CGPointMake(179.5, 227.75)],
            [NSValue valueWithCGPoint: CGPointMake(193, 230)],
            [NSValue valueWithCGPoint: CGPointMake(215, 237.5)],
            [NSValue valueWithCGPoint: CGPointMake(218, 237.5)],
            [NSValue valueWithCGPoint: CGPointMake(228.5, 232)],
            [NSValue valueWithCGPoint: CGPointMake(242.5, 232)],
            [NSValue valueWithCGPoint: CGPointMake(257, 232)],
            [NSValue valueWithCGPoint: CGPointMake(277, 227.75)],
            [NSValue valueWithCGPoint: CGPointMake(90.5, 261.5)],
            [NSValue valueWithCGPoint: CGPointMake(107.5, 258)],
            [NSValue valueWithCGPoint: CGPointMake(124.5, 261.5)],
            [NSValue valueWithCGPoint: CGPointMake(149, 264.5)],
            [NSValue valueWithCGPoint: CGPointMake(193, 269)],
            [NSValue valueWithCGPoint: CGPointMake(183.5, 272.5)],
            [NSValue valueWithCGPoint: CGPointMake(205.5, 261.5)],
            [NSValue valueWithCGPoint: CGPointMake(218, 255)],
            [NSValue valueWithCGPoint: CGPointMake(236.5, 255)],
            [NSValue valueWithCGPoint: CGPointMake(258.5, 255)],
            [NSValue valueWithCGPoint: CGPointMake(118.5, 282.5)],
            [NSValue valueWithCGPoint: CGPointMake(143, 285)],
            [NSValue valueWithCGPoint: CGPointMake(171, 286)],
            [NSValue valueWithCGPoint: CGPointMake(193, 286)],
            [NSValue valueWithCGPoint: CGPointMake(215, 278.5)],
            [NSValue valueWithCGPoint: CGPointMake(238, 276)], nil];
    
    p331 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(275.5, 163.5)],
            [NSValue valueWithCGPoint: CGPointMake(288, 176)],
            [NSValue valueWithCGPoint: CGPointMake(287, 159.5)],
            [NSValue valueWithCGPoint: CGPointMake(284.5, 144)],
            [NSValue valueWithCGPoint: CGPointMake(279.5, 130.5)],
            [NSValue valueWithCGPoint: CGPointMake(275.5, 122)],
            [NSValue valueWithCGPoint: CGPointMake(271.5, 114.5)],
            [NSValue valueWithCGPoint: CGPointMake(265.5, 106)],
            [NSValue valueWithCGPoint: CGPointMake(260.5, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(258, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(254, 106)],
            [NSValue valueWithCGPoint: CGPointMake(250, 107.5)],
            [NSValue valueWithCGPoint: CGPointMake(246.5, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(243.5, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(239.5, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(234.5, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(230, 107.5)],
            [NSValue valueWithCGPoint: CGPointMake(227, 106)],
            [NSValue valueWithCGPoint: CGPointMake(223, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(219, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(212, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(205.5, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(202.5, 106)],
            [NSValue valueWithCGPoint: CGPointMake(196, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(190, 104.5)],
            [NSValue valueWithCGPoint: CGPointMake(186, 103.5)],
            [NSValue valueWithCGPoint: CGPointMake(180.5, 105.5)],
            [NSValue valueWithCGPoint: CGPointMake(177, 103.5)],
            [NSValue valueWithCGPoint: CGPointMake(170, 103.5)],
            [NSValue valueWithCGPoint: CGPointMake(175.5, 102)],
            [NSValue valueWithCGPoint: CGPointMake(179, 99)],
            [NSValue valueWithCGPoint: CGPointMake(180.5, 97)],
            [NSValue valueWithCGPoint: CGPointMake(183.5, 94.5)],
            [NSValue valueWithCGPoint: CGPointMake(186, 91)],
            [NSValue valueWithCGPoint: CGPointMake(190, 91)],
            [NSValue valueWithCGPoint: CGPointMake(197.5, 91)],
            [NSValue valueWithCGPoint: CGPointMake(203, 91)],
            [NSValue valueWithCGPoint: CGPointMake(208, 88)],
            [NSValue valueWithCGPoint: CGPointMake(210, 84)],
            [NSValue valueWithCGPoint: CGPointMake(216.5, 83)],
            [NSValue valueWithCGPoint: CGPointMake(220, 85.5)],
            [NSValue valueWithCGPoint: CGPointMake(224, 84)],
            [NSValue valueWithCGPoint: CGPointMake(228, 85.5)],
            [NSValue valueWithCGPoint: CGPointMake(230, 81.5)],
            [NSValue valueWithCGPoint: CGPointMake(234.5, 79.5)],
            [NSValue valueWithCGPoint: CGPointMake(240.5, 79.5)],
            [NSValue valueWithCGPoint: CGPointMake(230, 72)],
            [NSValue valueWithCGPoint: CGPointMake(216.5, 64.5)],
            [NSValue valueWithCGPoint: CGPointMake(199, 57.5)],
            [NSValue valueWithCGPoint: CGPointMake(179, 53.5)],
            [NSValue valueWithCGPoint: CGPointMake(163.5, 52.5)],
            [NSValue valueWithCGPoint: CGPointMake(146.5, 53.5)],
            [NSValue valueWithCGPoint: CGPointMake(130, 56)],
            [NSValue valueWithCGPoint: CGPointMake(117, 61)],
            [NSValue valueWithCGPoint: CGPointMake(105.5, 66)],
            [NSValue valueWithCGPoint: CGPointMake(111, 69)],
            [NSValue valueWithCGPoint: CGPointMake(115, 73)],
            [NSValue valueWithCGPoint: CGPointMake(118, 78.5)],
            [NSValue valueWithCGPoint: CGPointMake(118.5, 84)],
            [NSValue valueWithCGPoint: CGPointMake(115, 92)],
            [NSValue valueWithCGPoint: CGPointMake(109.5, 97)],
            [NSValue valueWithCGPoint: CGPointMake(105.5, 99)],
            [NSValue valueWithCGPoint: CGPointMake(101, 99)],
            [NSValue valueWithCGPoint: CGPointMake(94, 96)],
            [NSValue valueWithCGPoint: CGPointMake(89, 92)],
            [NSValue valueWithCGPoint: CGPointMake(85.5, 85.5)],
            [NSValue valueWithCGPoint: CGPointMake(85.5, 79.5)],
            [NSValue valueWithCGPoint: CGPointMake(73, 90.5)],
            [NSValue valueWithCGPoint: CGPointMake(64.5, 100.5)],
            [NSValue valueWithCGPoint: CGPointMake(57, 112)],
            [NSValue valueWithCGPoint: CGPointMake(51.5, 123)],
            [NSValue valueWithCGPoint: CGPointMake(50, 129)],
            [NSValue valueWithCGPoint: CGPointMake(53.5, 129)],
            [NSValue valueWithCGPoint: CGPointMake(57, 128)],
            [NSValue valueWithCGPoint: CGPointMake(63.5, 132)],
            [NSValue valueWithCGPoint: CGPointMake(69.5, 132)],
            [NSValue valueWithCGPoint: CGPointMake(75.5, 137)],
            [NSValue valueWithCGPoint: CGPointMake(79, 136)],
            [NSValue valueWithCGPoint: CGPointMake(84, 138.5)],
            [NSValue valueWithCGPoint: CGPointMake(81.5, 139.5)],
            [NSValue valueWithCGPoint: CGPointMake(75.5, 141)],
            [NSValue valueWithCGPoint: CGPointMake(70.5, 140)],
            [NSValue valueWithCGPoint: CGPointMake(68.5, 141)],
            [NSValue valueWithCGPoint: CGPointMake(64.5, 141)],
            [NSValue valueWithCGPoint: CGPointMake(61.5, 141)],
            [NSValue valueWithCGPoint: CGPointMake(59.5, 143)],
            [NSValue valueWithCGPoint: CGPointMake(57.5, 142)],
            [NSValue valueWithCGPoint: CGPointMake(55.5, 142)],
            [NSValue valueWithCGPoint: CGPointMake(50, 139.5)],
            [NSValue valueWithCGPoint: CGPointMake(44.5, 142)],
            [NSValue valueWithCGPoint: CGPointMake(42, 150.5)],
            [NSValue valueWithCGPoint: CGPointMake(40, 176.5)],
            [NSValue valueWithCGPoint: CGPointMake(44.5, 206.5)],
            [NSValue valueWithCGPoint: CGPointMake(51.5, 199.5)],
            [NSValue valueWithCGPoint: CGPointMake(57, 195.5)],
            [NSValue valueWithCGPoint: CGPointMake(68.5, 183)],
            [NSValue valueWithCGPoint: CGPointMake(79, 171.5)],
            [NSValue valueWithCGPoint: CGPointMake(258, 159.5)],
            [NSValue valueWithCGPoint: CGPointMake(267.17, 163.5)],
            [NSValue valueWithCGPoint: CGPointMake(267.17, 175)],
            [NSValue valueWithCGPoint: CGPointMake(246.5, 136)],
            [NSValue valueWithCGPoint: CGPointMake(238, 128.5)],
            [NSValue valueWithCGPoint: CGPointMake(230, 138.5)],
            [NSValue valueWithCGPoint: CGPointMake(219, 151)],
            [NSValue valueWithCGPoint: CGPointMake(214.5, 148.5)],
            [NSValue valueWithCGPoint: CGPointMake(197.5, 166.5)],
            [NSValue valueWithCGPoint: CGPointMake(183.5, 187)],
            [NSValue valueWithCGPoint: CGPointMake(262, 166.5)],
            [NSValue valueWithCGPoint: CGPointMake(267.17, 175)],
            [NSValue valueWithCGPoint: CGPointMake(175.5, 178)],
            [NSValue valueWithCGPoint: CGPointMake(155, 158)],
            [NSValue valueWithCGPoint: CGPointMake(147.5, 138.5)],
            [NSValue valueWithCGPoint: CGPointMake(143, 138.5)],
            [NSValue valueWithCGPoint: CGPointMake(136.5, 128.5)],
            [NSValue valueWithCGPoint: CGPointMake(183.5, 189.5)],
            [NSValue valueWithCGPoint: CGPointMake(187, 193)],
            [NSValue valueWithCGPoint: CGPointMake(194.25, 200.25)],
            [NSValue valueWithCGPoint: CGPointMake(125, 137)],
            [NSValue valueWithCGPoint: CGPointMake(121.5, 144)],
            [NSValue valueWithCGPoint: CGPointMake(110.5, 156.5)],
            [NSValue valueWithCGPoint: CGPointMake(104.5, 154)],
            [NSValue valueWithCGPoint: CGPointMake(132.5, 136)],
            [NSValue valueWithCGPoint: CGPointMake(131, 144)],
            [NSValue valueWithCGPoint: CGPointMake(89, 174)],
            [NSValue valueWithCGPoint: CGPointMake(79, 171.5)],
            [NSValue valueWithCGPoint: CGPointMake(104.5, 166.5)],
            [NSValue valueWithCGPoint: CGPointMake(106.5, 178)],
            [NSValue valueWithCGPoint: CGPointMake(82.5, 177.5)],
            [NSValue valueWithCGPoint: CGPointMake(84, 184.5)],
            [NSValue valueWithCGPoint: CGPointMake(84, 194)],
            [NSValue valueWithCGPoint: CGPointMake(89, 203.5)],
            [NSValue valueWithCGPoint: CGPointMake(194.25, 200.25)],
            [NSValue valueWithCGPoint: CGPointMake(269, 178)],
            [NSValue valueWithCGPoint: CGPointMake(267.17, 175)],
            [NSValue valueWithCGPoint: CGPointMake(208, 195.5)],
            [NSValue valueWithCGPoint: CGPointMake(209.16, 197)],
            [NSValue valueWithCGPoint: CGPointMake(209.16, 197)],
            [NSValue valueWithCGPoint: CGPointMake(216.5, 194)],
            [NSValue valueWithCGPoint: CGPointMake(223, 197)],
            [NSValue valueWithCGPoint: CGPointMake(233, 203.5)],
            [NSValue valueWithCGPoint: CGPointMake(243.5, 207.5)],
            [NSValue valueWithCGPoint: CGPointMake(252, 214.5)],
            [NSValue valueWithCGPoint: CGPointMake(258, 216)],
            [NSValue valueWithCGPoint: CGPointMake(273.5, 228)],
            [NSValue valueWithCGPoint: CGPointMake(128, 160.5)],
            [NSValue valueWithCGPoint: CGPointMake(129.5, 151)], nil];
    
    // -----------------------------------------------------------------------------------------------------------------
    
    p411 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(182, 131.5)],
            [NSValue valueWithCGPoint: CGPointMake(191.5, 126)],
            [NSValue valueWithCGPoint: CGPointMake(201, 119)],
            [NSValue valueWithCGPoint: CGPointMake(207.5, 112)],
            [NSValue valueWithCGPoint: CGPointMake(211.5, 105)],
            [NSValue valueWithCGPoint: CGPointMake(214, 99)],
            [NSValue valueWithCGPoint: CGPointMake(122.5, 112.5)],
            [NSValue valueWithCGPoint: CGPointMake(116.5, 110.5)],
            [NSValue valueWithCGPoint: CGPointMake(111.5, 107.5)],
            [NSValue valueWithCGPoint: CGPointMake(147.5, 109.5)],
            [NSValue valueWithCGPoint: CGPointMake(155.5, 107)],
            [NSValue valueWithCGPoint: CGPointMake(163.5, 102.5)],
            [NSValue valueWithCGPoint: CGPointMake(177.5, 87.5)],
            [NSValue valueWithCGPoint: CGPointMake(122, 129.5)],
            [NSValue valueWithCGPoint: CGPointMake(129.5, 129.5)],
            [NSValue valueWithCGPoint: CGPointMake(137.5, 128.5)],
            [NSValue valueWithCGPoint: CGPointMake(144.5, 127)],
            [NSValue valueWithCGPoint: CGPointMake(153, 125)],
            [NSValue valueWithCGPoint: CGPointMake(131.5, 147)],
            [NSValue valueWithCGPoint: CGPointMake(135.5, 146)],
            [NSValue valueWithCGPoint: CGPointMake(107, 147)],
            [NSValue valueWithCGPoint: CGPointMake(100, 144.5)],
            [NSValue valueWithCGPoint: CGPointMake(98.5, 185)],
            [NSValue valueWithCGPoint: CGPointMake(89.5, 181.5)],
            [NSValue valueWithCGPoint: CGPointMake(80.5, 176)],
            [NSValue valueWithCGPoint: CGPointMake(132, 186.5)],
            [NSValue valueWithCGPoint: CGPointMake(136.5, 186)],
            [NSValue valueWithCGPoint: CGPointMake(145.5, 184.5)],
            [NSValue valueWithCGPoint: CGPointMake(156, 182)],
            [NSValue valueWithCGPoint: CGPointMake(165.5, 179.5)],
            [NSValue valueWithCGPoint: CGPointMake(175, 176.5)],
            [NSValue valueWithCGPoint: CGPointMake(184.5, 173.5)],
            [NSValue valueWithCGPoint: CGPointMake(194.5, 169)],
            [NSValue valueWithCGPoint: CGPointMake(204, 164.5)],
            [NSValue valueWithCGPoint: CGPointMake(212, 159.5)],
            [NSValue valueWithCGPoint: CGPointMake(218, 155.5)],
            [NSValue valueWithCGPoint: CGPointMake(223.5, 152)],
            [NSValue valueWithCGPoint: CGPointMake(236, 139)],
            [NSValue valueWithCGPoint: CGPointMake(239.5, 133)],
            [NSValue valueWithCGPoint: CGPointMake(242.5, 125.5)],
            [NSValue valueWithCGPoint: CGPointMake(153.5, 163)],
            [NSValue valueWithCGPoint: CGPointMake(166.5, 159)],
            [NSValue valueWithCGPoint: CGPointMake(175, 156)],
            [NSValue valueWithCGPoint: CGPointMake(184, 152)],
            [NSValue valueWithCGPoint: CGPointMake(191.5, 148.5)],
            [NSValue valueWithCGPoint: CGPointMake(198, 145)],
            [NSValue valueWithCGPoint: CGPointMake(113.5, 204.5)],
            [NSValue valueWithCGPoint: CGPointMake(121, 204.5)],
            [NSValue valueWithCGPoint: CGPointMake(129, 203.5)],
            [NSValue valueWithCGPoint: CGPointMake(216.5, 177.5)],
            [NSValue valueWithCGPoint: CGPointMake(224, 173)],
            [NSValue valueWithCGPoint: CGPointMake(233, 166)],
            [NSValue valueWithCGPoint: CGPointMake(239, 161.5)],
            [NSValue valueWithCGPoint: CGPointMake(243, 157)],
            [NSValue valueWithCGPoint: CGPointMake(191.5, 232.5)],
            [NSValue valueWithCGPoint: CGPointMake(200.5, 229)],
            [NSValue valueWithCGPoint: CGPointMake(208.5, 225.5)],
            [NSValue valueWithCGPoint: CGPointMake(215, 222.5)],
            [NSValue valueWithCGPoint: CGPointMake(221, 219.5)],
            [NSValue valueWithCGPoint: CGPointMake(223.5, 216.5)],
            [NSValue valueWithCGPoint: CGPointMake(234.5, 225.5)],
            [NSValue valueWithCGPoint: CGPointMake(240, 221.5)],
            [NSValue valueWithCGPoint: CGPointMake(247.5, 214)],
            [NSValue valueWithCGPoint: CGPointMake(210.5, 238.5)],
            [NSValue valueWithCGPoint: CGPointMake(200, 242.5)],
            [NSValue valueWithCGPoint: CGPointMake(190, 246)],
            [NSValue valueWithCGPoint: CGPointMake(179, 249)],
            [NSValue valueWithCGPoint: CGPointMake(168.5, 251.5)],
            [NSValue valueWithCGPoint: CGPointMake(154.5, 253)],
            [NSValue valueWithCGPoint: CGPointMake(141, 253.5)],
            [NSValue valueWithCGPoint: CGPointMake(129.5, 253)], nil];
    
    p421 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(71.5, 178)],
            [NSValue valueWithCGPoint: CGPointMake(62.5, 185)],
            [NSValue valueWithCGPoint: CGPointMake(54, 193)],
            [NSValue valueWithCGPoint: CGPointMake(48, 201)],
            [NSValue valueWithCGPoint: CGPointMake(46, 209)],
            [NSValue valueWithCGPoint: CGPointMake(47, 217)],
            [NSValue valueWithCGPoint: CGPointMake(51, 223.5)],
            [NSValue valueWithCGPoint: CGPointMake(58, 229)],
            [NSValue valueWithCGPoint: CGPointMake(68.5, 233.5)],
            [NSValue valueWithCGPoint: CGPointMake(79.5, 236)],
            [NSValue valueWithCGPoint: CGPointMake(91, 237)],
            [NSValue valueWithCGPoint: CGPointMake(102, 237.5)],
            [NSValue valueWithCGPoint: CGPointMake(108.5, 237.3)],
            [NSValue valueWithCGPoint: CGPointMake(81, 167)],
            [NSValue valueWithCGPoint: CGPointMake(83.5, 154.5)],
            [NSValue valueWithCGPoint: CGPointMake(87, 144)],
            [NSValue valueWithCGPoint: CGPointMake(91.5, 132.5)],
            [NSValue valueWithCGPoint: CGPointMake(97, 124)],
            [NSValue valueWithCGPoint: CGPointMake(104, 114.5)],
            [NSValue valueWithCGPoint: CGPointMake(112, 107)],
            [NSValue valueWithCGPoint: CGPointMake(120, 101.5)],
            [NSValue valueWithCGPoint: CGPointMake(128.5, 96.5)],
            [NSValue valueWithCGPoint: CGPointMake(167.5, 86.5)],
            [NSValue valueWithCGPoint: CGPointMake(181.5, 87.5)],
            [NSValue valueWithCGPoint: CGPointMake(195.5, 90)],
            [NSValue valueWithCGPoint: CGPointMake(208, 95)],
            [NSValue valueWithCGPoint: CGPointMake(220, 102.5)],
            [NSValue valueWithCGPoint: CGPointMake(228.5, 109.5)],
            [NSValue valueWithCGPoint: CGPointMake(235.5, 116.5)],
            [NSValue valueWithCGPoint: CGPointMake(241.5, 123.5)],
            [NSValue valueWithCGPoint: CGPointMake(80.5, 180.5)],
            [NSValue valueWithCGPoint: CGPointMake(81.5, 188)],
            [NSValue valueWithCGPoint: CGPointMake(250.5, 122)],
            [NSValue valueWithCGPoint: CGPointMake(262.5, 121.5)],
            [NSValue valueWithCGPoint: CGPointMake(274, 123)],
            [NSValue valueWithCGPoint: CGPointMake(284.5, 127)],
            [NSValue valueWithCGPoint: CGPointMake(291.5, 132.5)],
            [NSValue valueWithCGPoint: CGPointMake(294, 140)],
            [NSValue valueWithCGPoint: CGPointMake(293.5, 149)],
            [NSValue valueWithCGPoint: CGPointMake(290, 157.5)],
            [NSValue valueWithCGPoint: CGPointMake(279.5, 171)],
            [NSValue valueWithCGPoint: CGPointMake(271, 179.5)],
            [NSValue valueWithCGPoint: CGPointMake(258, 189.5)],
            [NSValue valueWithCGPoint: CGPointMake(254.67, 191.5)],
            [NSValue valueWithCGPoint: CGPointMake(245, 128.5)],
            [NSValue valueWithCGPoint: CGPointMake(248, 135)],
            [NSValue valueWithCGPoint: CGPointMake(77.5, 190.5)],
            [NSValue valueWithCGPoint: CGPointMake(74, 195)],
            [NSValue valueWithCGPoint: CGPointMake(72.5, 200)],
            [NSValue valueWithCGPoint: CGPointMake(73, 205)],
            [NSValue valueWithCGPoint: CGPointMake(75.5, 209)],
            [NSValue valueWithCGPoint: CGPointMake(80.5, 212)],
            [NSValue valueWithCGPoint: CGPointMake(88, 215)],
            [NSValue valueWithCGPoint: CGPointMake(90.5, 215.47)],
            [NSValue valueWithCGPoint: CGPointMake(84, 196.5)],
            [NSValue valueWithCGPoint: CGPointMake(86.5, 205)],
            [NSValue valueWithCGPoint: CGPointMake(90.5, 215.47)],
            [NSValue valueWithCGPoint: CGPointMake(254.5, 135)],
            [NSValue valueWithCGPoint: CGPointMake(262.5, 138)],
            [NSValue valueWithCGPoint: CGPointMake(265.5, 142)],
            [NSValue valueWithCGPoint: CGPointMake(266, 148)],
            [NSValue valueWithCGPoint: CGPointMake(264.5, 153.5)],
            [NSValue valueWithCGPoint: CGPointMake(260.5, 159)],
            [NSValue valueWithCGPoint: CGPointMake(256.83, 163)],
            [NSValue valueWithCGPoint: CGPointMake(251, 142)],
            [NSValue valueWithCGPoint: CGPointMake(254.67, 153.5)],
            [NSValue valueWithCGPoint: CGPointMake(256.83, 163)],
            [NSValue valueWithCGPoint: CGPointMake(118.5, 237)],
            [NSValue valueWithCGPoint: CGPointMake(139.5, 234.5)],
            [NSValue valueWithCGPoint: CGPointMake(157, 231)],
            [NSValue valueWithCGPoint: CGPointMake(172.5, 227)],
            [NSValue valueWithCGPoint: CGPointMake(192, 221)],
            [NSValue valueWithCGPoint: CGPointMake(211.5, 213.5)],
            [NSValue valueWithCGPoint: CGPointMake(227, 206.5)],
            [NSValue valueWithCGPoint: CGPointMake(243, 198.5)],
            [NSValue valueWithCGPoint: CGPointMake(254.67, 191.5)],
            [NSValue valueWithCGPoint: CGPointMake(113.5, 243)],
            [NSValue valueWithCGPoint: CGPointMake(121.5, 249)],
            [NSValue valueWithCGPoint: CGPointMake(130.5, 253.5)],
            [NSValue valueWithCGPoint: CGPointMake(139.5, 257)],
            [NSValue valueWithCGPoint: CGPointMake(150.5, 260.5)],
            [NSValue valueWithCGPoint: CGPointMake(163, 262.5)],
            [NSValue valueWithCGPoint: CGPointMake(175, 262.5)],
            [NSValue valueWithCGPoint: CGPointMake(186, 261.5)],
            [NSValue valueWithCGPoint: CGPointMake(195.5, 259)],
            [NSValue valueWithCGPoint: CGPointMake(203, 256)],
            [NSValue valueWithCGPoint: CGPointMake(212.5, 251.5)],
            [NSValue valueWithCGPoint: CGPointMake(220, 246.5)],
            [NSValue valueWithCGPoint: CGPointMake(226, 242)],
            [NSValue valueWithCGPoint: CGPointMake(234, 233.5)],
            [NSValue valueWithCGPoint: CGPointMake(242, 223.5)],
            [NSValue valueWithCGPoint: CGPointMake(247.5, 214)],
            [NSValue valueWithCGPoint: CGPointMake(252.5, 202)],
            [NSValue valueWithCGPoint: CGPointMake(254.67, 191.5)],
            [NSValue valueWithCGPoint: CGPointMake(255, 165)],
            [NSValue valueWithCGPoint: CGPointMake(250, 170)],
            [NSValue valueWithCGPoint: CGPointMake(244, 174.5)],
            [NSValue valueWithCGPoint: CGPointMake(236.5, 179.5)],
            [NSValue valueWithCGPoint: CGPointMake(229.5, 184)],
            [NSValue valueWithCGPoint: CGPointMake(222.5, 188)],
            [NSValue valueWithCGPoint: CGPointMake(215.5, 191.5)],
            [NSValue valueWithCGPoint: CGPointMake(206.5, 196)],
            [NSValue valueWithCGPoint: CGPointMake(195, 201)],
            [NSValue valueWithCGPoint: CGPointMake(183.5, 205)],
            [NSValue valueWithCGPoint: CGPointMake(171.5, 208.5)],
            [NSValue valueWithCGPoint: CGPointMake(160, 211.5)],
            [NSValue valueWithCGPoint: CGPointMake(148, 214)],
            [NSValue valueWithCGPoint: CGPointMake(136, 216)],
            [NSValue valueWithCGPoint: CGPointMake(124, 217)],
            [NSValue valueWithCGPoint: CGPointMake(112.5, 217.5)],
            [NSValue valueWithCGPoint: CGPointMake(103.5, 217)],
            [NSValue valueWithCGPoint: CGPointMake(96, 216.5)],
            [NSValue valueWithCGPoint: CGPointMake(90.5, 215.47)], nil];
    
    p431 = [NSArray arrayWithObjects: [NSValue valueWithCGPoint: CGPointMake(237, 71)],
                                      [NSValue valueWithCGPoint: CGPointMake(247, 73)],
                                      [NSValue valueWithCGPoint: CGPointMake(247.5, 78)],
                                      [NSValue valueWithCGPoint: CGPointMake(245.5, 82)],
                                      [NSValue valueWithCGPoint: CGPointMake(240.5, 83.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(235.5, 81)],
                                      [NSValue valueWithCGPoint: CGPointMake(234, 75.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(237, 71)],
                                      [NSValue valueWithCGPoint: CGPointMake(55.5, 96.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(74.5, 93)],
                                      [NSValue valueWithCGPoint: CGPointMake(80.5, 100)],
                                      [NSValue valueWithCGPoint: CGPointMake(81, 109.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(77, 117)],
                                      [NSValue valueWithCGPoint: CGPointMake(68.5, 121)],
                                      [NSValue valueWithCGPoint: CGPointMake(59.5, 119)],
                                      [NSValue valueWithCGPoint: CGPointMake(55.5, 96.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(94.5, 262)],
                                      [NSValue valueWithCGPoint: CGPointMake(96.5, 261)],
                                      [NSValue valueWithCGPoint: CGPointMake(99.5, 262)],
                                      [NSValue valueWithCGPoint: CGPointMake(98.5, 269)],
                                      [NSValue valueWithCGPoint: CGPointMake(95, 269)],
                                      [NSValue valueWithCGPoint: CGPointMake(93.5, 267)],
                                      [NSValue valueWithCGPoint: CGPointMake(93, 264.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(94.5, 262)],
                                      [NSValue valueWithCGPoint: CGPointMake(260, 231)],
                                      [NSValue valueWithCGPoint: CGPointMake(262, 229)],
                                      [NSValue valueWithCGPoint: CGPointMake(264.5, 229)],
                                      [NSValue valueWithCGPoint: CGPointMake(266.5, 230.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(267, 233)],
                                      [NSValue valueWithCGPoint: CGPointMake(266, 235)],
                                      [NSValue valueWithCGPoint: CGPointMake(263.5, 236)],
                                      [NSValue valueWithCGPoint: CGPointMake(261, 235.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(260, 231)],
                                      [NSValue valueWithCGPoint: CGPointMake(272.5, 201)],
                                      [NSValue valueWithCGPoint: CGPointMake(284.5, 198)],
                                      [NSValue valueWithCGPoint: CGPointMake(289, 201.5)],
                                      [NSValue valueWithCGPoint: CGPointMake(289.5, 211)],
                                      [NSValue valueWithCGPoint: CGPointMake(281.5, 217)],
                                      [NSValue valueWithCGPoint: CGPointMake(271.5, 212)],
                                      [NSValue valueWithCGPoint: CGPointMake(270, 207)],
                                      [NSValue valueWithCGPoint: CGPointMake(272.5, 201)], nil];
}

@end
