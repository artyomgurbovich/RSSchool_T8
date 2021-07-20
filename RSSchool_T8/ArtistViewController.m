//
//  ViewController.m
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 18.07.21.
//

#import "ArtistViewController.h"
#import "CurveView.h"
#import "RSSchool_T8-Swift.h"

@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) IBOutlet CurveView *curveView;
@property (weak, nonatomic) IBOutlet UIButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet UIButton *openTimerButton;
@property (weak, nonatomic) IBOutlet UIButton *drawButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIView *paletteView;
@property (weak, nonatomic) IBOutlet UIView *timerView;

@end

@implementation ArtistViewController


NSMutableArray *colors = NULL;
float drawTime = 1.0;
int active = 1;
bool needReset = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    colors = [NSMutableArray arrayWithObjects:UIColor.blackColor, UIColor.blackColor, UIColor.blackColor, nil];
    [self setupUI];
    [_curveView prepare];
}

- (IBAction)openPaletteTapped:(id)sender {
    [_paletteView setHidden: false];
}

- (IBAction)openTimerTapped:(id)sender {
    [_timerView setHidden: false];
}

- (IBAction)drawTapped:(id)sender {
    if (needReset) {
        [_curveView start:0.1 clrs:colors pos:-1];
        [self->_drawButton setTitle:@"Draw" forState:UIControlStateNormal];
        [_openPaletteButton setEnabled:true];
        [_openTimerButton setEnabled:true];
        [_shareButton setEnabled:false];
        needReset = false;
    } else {
        [_curveView start:drawTime clrs:colors pos:active];
        [_openPaletteButton setEnabled:false];
        [_openTimerButton setEnabled:false];
        [_drawButton setEnabled:false];
        [NSTimer scheduledTimerWithTimeInterval:drawTime repeats:NO block:^(NSTimer * _Nonnull timer) {
            needReset = true;
            [self->_drawButton setTitle:@"Reset" forState:UIControlStateNormal];
            [self->_drawButton setEnabled:true];
            [self->_shareButton setEnabled:true];
        }];
    }
}

- (IBAction)shareTapped:(id)sender {
    UIImage* img = [_curveView captureView];
    NSMutableArray *sharingItems = [NSMutableArray new];
    [sharingItems addObject:img];
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"Drawings"]) {
        DrawingsViewController *vc = (DrawingsViewController*)[segue destinationViewController];
        vc.currentActive = active;
    }
}

- (void)setupUI {
    [_barButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Montserrat-Regular" size:17.0], NSFontAttributeName, [UIColor colorNamed:@"Light Green Sea"], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    _curveView.layer.cornerRadius = 8;
    _openPaletteButton.layer.cornerRadius = 10;
    _openTimerButton.layer.cornerRadius = 10;
    _drawButton.layer.cornerRadius = 10;
    _shareButton.layer.cornerRadius = 10;
    [self addShadow:_curveView color:[UIColor colorNamed:@"Chill Sky"] radius:8 opacity:0.25];
    [self addShadow:_openPaletteButton color:UIColor.blackColor radius:2 opacity:0.25];
    [self addShadow:_openTimerButton color:UIColor.blackColor radius:2 opacity:0.25];
    [self addShadow:_drawButton color:UIColor.blackColor radius:2 opacity:0.25];
    [self addShadow:_shareButton color:UIColor.blackColor radius:2 opacity:0.25];
}

-(void)updatePalette:(NSMutableArray*)palette {
    [_paletteView setHidden: true];
    colors = palette;
}

-(void)updateTime:(float)time {
    [_timerView setHidden: true];
    drawTime = time;
}

-(void)updateDrawing:(int)index {
    active = index;
}

-(void)addShadow:(UIView*)view color:(UIColor*)color radius:(double)radius opacity:(double)opacity {
    view.layer.shadowRadius = radius;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    view.layer.shadowOpacity = opacity;
    view.layer.masksToBounds = NO;
}

@end
