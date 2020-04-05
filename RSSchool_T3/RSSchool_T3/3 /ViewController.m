#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UILabel *labelResultColor;
@property (weak, nonatomic) UIView *viewResultColor;

@property (weak, nonatomic) UITextField *textFieldRed;
@property (weak, nonatomic) UITextField *textFieldGreen;
@property (weak, nonatomic) UITextField *textFieldBlue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.accessibilityIdentifier = @"mainView";
    CGFloat wdth = self.view.frame.size.width;
    
    self.labelResultColor = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 60.0, 100.0, 20.0)];
    self.labelResultColor.text = @"Color";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    [self.view addSubview:self.labelResultColor];

    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectMake(150.0, 50.0, wdth-150-20, 40.0)];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.viewResultColor.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.viewResultColor];

    UILabel *labelRed = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 120.0, 80.0, 20.0)];
    labelRed.text = @"RED";
    labelRed.accessibilityIdentifier = @"labelRed";
    [self.view addSubview:labelRed];

    self.textFieldRed = [[UITextField alloc] initWithFrame:CGRectMake(110.0, 110.0, wdth-110-20, 40.0)];
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.placeholder = @"0..255";
    [self.view addSubview:self.textFieldRed];
    self.textFieldRed.delegate = self;

    UILabel *labelGreen = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 180.0, 80.0, 20.0)];
    labelGreen.text = @"GREEN";
    labelGreen.accessibilityIdentifier = @"labelGreen";
    [self.view addSubview:labelGreen];

    self.textFieldGreen = [[UITextField alloc] initWithFrame:CGRectMake(110.0, 170.0, wdth-110-20, 40.0)];
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.placeholder = @"0..255";
    [self.view addSubview:self.textFieldGreen];
    self.textFieldGreen.delegate = self;

    UILabel *labelBlue = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 240.0, 80.0, 20.0)];
    labelBlue.text = @"BLUE";
    labelBlue.accessibilityIdentifier = @"labelBlue";
    [self.view addSubview:labelBlue];

    self.textFieldBlue = [[UITextField alloc] initWithFrame:CGRectMake(110.0, 230.0, wdth-110-20, 40.0)];
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.placeholder = @"0..255";
    [self.view addSubview:self.textFieldBlue];
    self.textFieldBlue.delegate = self;
    
    UIButton *buttonProcess = [[UIButton alloc] initWithFrame:CGRectMake(120.0, 300.0, wdth-120-120, 40.0)];
    [buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    buttonProcess.backgroundColor = [UIColor blueColor];
    [self.view addSubview:buttonProcess];

    [buttonProcess addTarget:self action:@selector(buttonProcessTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.labelResultColor.text = @"Color";
    self.viewResultColor.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void) buttonProcessTapped {
    [self.view endEditing:YES];
    NSInteger numRed = [self.textFieldRed.text integerValue];
    NSInteger numGreen = [self.textFieldGreen.text integerValue];
    NSInteger numBlue = [self.textFieldBlue.text integerValue];

    if ([self.textFieldRed.text isEqualToString:[NSString stringWithFormat:@"%ld", numRed]]
            && [self.textFieldGreen.text isEqualToString:[NSString stringWithFormat:@"%ld", numGreen]]
            && [self.textFieldBlue.text isEqualToString:[NSString stringWithFormat:@"%ld", numBlue]]
            && numRed>=0 && numRed<=255 && numGreen>=0 && numGreen<=255 && numBlue>=0 && numBlue<=255) {
        UIColor *color = [UIColor colorWithRed:numRed/255.0f green:numGreen/255.0f blue:numBlue/255.0f alpha:1];
        self.viewResultColor.backgroundColor = color;
        NSString *col = [NSString stringWithFormat:@"0x%06lX", (numRed<<16 | numGreen<<8 | numBlue<<0)];
        self.labelResultColor.text = col;
    } else {
        self.labelResultColor.text = @"Error";
        self.viewResultColor.backgroundColor = [UIColor whiteColor];
    }
    
    self.textFieldRed.text = @"";
    self.textFieldGreen.text = @"";
    self.textFieldBlue.text = @"";
}

@end
