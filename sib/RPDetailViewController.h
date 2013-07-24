//
//  RPDetailViewController.h
//  sib
//
//  Created by David Ohayon on 7/24/13.
//  Copyright (c) 2013 ohwutup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) NSDictionary *restaurant;
- (IBAction)closeViewButtonTapped:(id)sender;

@end
