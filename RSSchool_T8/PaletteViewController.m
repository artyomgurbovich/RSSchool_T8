//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by Artyom Gurbovich on 18.07.21.
//

#import "PaletteViewController.h"
#import "ArtistViewController.h"

@interface PaletteViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *paletteViews;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *paletteButtons;

@end

@implementation PaletteViewController

NSMutableArray *selectedColors = NULL;
NSTimer *timer = NULL;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    selectedColors = [[NSMutableArray alloc] init];
}

- (IBAction)saveTapped:(id)sender {
    ArtistViewController *vc = (ArtistViewController*)[self parentViewController];
    [vc updatePalette:[self prepareSelectedColors]];
}

- (void)setupUI {
    [self view].layer.cornerRadius = 40;
    _saveButton.layer.cornerRadius = 10;
    [self addShadow:[self view] color:UIColor.blackColor radius:8 opacity:0.25];
    [self addShadow:_saveButton color:UIColor.blackColor radius:2 opacity:0.25];
    for (UIView *paletteView in self.paletteViews) {
        paletteView.layer.cornerRadius = 10;
        [self addShadow:paletteView color:UIColor.blackColor radius:2 opacity:0.25];
    }
    for (UIButton *paletteButton in self.paletteButtons) {
        paletteButton.layer.cornerRadius = 6;
        [paletteButton addTarget:self action:@selector(paletteButtonTapped:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)updatePaletteButton {
    for (UIButton *paletteButton in self.paletteButtons) {
        if ([selectedColors containsObject: paletteButton.backgroundColor]) {
            [paletteButton setFrame: CGRectMake(2, 2, 36, 36)];
            paletteButton.layer.cornerRadius = 8;
        } else {
            [paletteButton setFrame: CGRectMake(8, 8, 24, 24)];
            paletteButton.layer.cornerRadius = 6;
        }
    }
}

- (void)paletteButtonTapped:(UIButton*)paletteButton {
    if ([selectedColors containsObject: paletteButton.backgroundColor]) {
        [selectedColors removeObject:paletteButton.backgroundColor];
    } else {
        [selectedColors addObject:paletteButton.backgroundColor];
        [[self view] setBackgroundColor:paletteButton.backgroundColor];
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [[self view] setBackgroundColor:UIColor.whiteColor];
        }];
    }
    if ([selectedColors count] > 3) {
        [selectedColors removeObjectAtIndex:0];
    }
    [self updatePaletteButton];
}

-(NSMutableArray*)prepareSelectedColors {
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:selectedColors copyItems:YES];
    while ([temp count] < 3) {
        [temp addObject: UIColor.blackColor];
    }
    for (int i = 0; i < 3; i++) {
        int randomInt1 = arc4random() % 3;
        int randomInt2 = arc4random() % 3;
        [temp exchangeObjectAtIndex:randomInt1 withObjectAtIndex:randomInt2];
    }
    return temp;
}

-(void)addShadow:(UIView*)view color:(UIColor*)color radius:(double)radius opacity:(double)opacity {
    view.layer.shadowRadius = radius;
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    view.layer.shadowOpacity = opacity;
    view.layer.masksToBounds = NO;
}

@end
