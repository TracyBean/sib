//
//  RPDetailViewController.m
//  sib
//
//  Created by David Ohayon on 7/24/13.
//  Copyright (c) 2013 ohwutup. All rights reserved.
//

#import "RPDetailViewController.h"

@interface RPDetailViewController ()

@end

@implementation RPDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameLabel.text = self.restaurant[@"name"];
    self.addressLabel.text = self.restaurant[@"address"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeViewButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
