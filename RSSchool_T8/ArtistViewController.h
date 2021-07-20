//
//  ViewController.h
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 18.07.21.
//

#import <UIKit/UIKit.h>

@interface ArtistViewController : UIViewController

-(void)updatePalette:(NSMutableArray*)palette;
-(void)updateTime:(float)time;
-(void)updateDrawing:(int)index;

@end
