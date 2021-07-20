//
//  CurveView.h
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 19.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurveView : UIView

-(void)prepare;
-(void)start:(float)t clrs:(NSMutableArray*)clrs pos:(int)pos;
- (UIImage *)captureView;

@end

NS_ASSUME_NONNULL_END
