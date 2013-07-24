//
//  RPViewController.m
//  sib
//
//  Created by David Ohayon on 7/24/13.
//  Copyright (c) 2013 ohwutup. All rights reserved.
//

#import "RPViewController.h"
#import "RPDetailViewController.h"
#import "AFNetworking.h"

@interface RPViewController ()
@property (strong, nonatomic) NSArray *restaurants;
@end

@implementation RPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://vast-coast-7705.herokuapp.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        self.restaurants = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", self.restaurants);
        [self.tableView reloadData];
    }];

//
//    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
//    [client registerHTTPOperationClass:[AFJSONRequestOperation class]];
//    [client setDefaultHeader:@"Accept" value:@"application/json"];
//    [client getPath:@"restaurants.json"
//         parameters:nil
//            success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                
//                NSLog(@"%@", responseObject);
//                self.restaurants = responseObject;
//                [self.tableView reloadData];
//    }
//            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"%@", error);
//            }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurants.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.restaurants[indexPath.row][@"name"];
    return cell;
}

#pragma mark UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RPDetailViewController *detailVC = [[RPDetailViewController alloc] initWithNibName:@"RPDetailViewController" bundle:nil];
    detailVC.restaurant = self.restaurants[indexPath.row];
    [self presentViewController:detailVC animated:YES completion:nil];
}

@end
