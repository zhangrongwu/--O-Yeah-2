//
//  RightViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-16.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()



@end

@implementation RightViewController

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
    // Do any additional setup after loading the view.
    
    self.view.alpha = 0.9;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:134/255.0 green:188/255.0 blue:146/255.0 alpha:1];
    
    NSArray *arr = [NSArray arrayWithObjects:[UIColor redColor], [UIColor cyanColor], [UIColor orangeColor], [UIColor greenColor], [UIColor colorWithRed:97/255.0 green:101/255.0 blue:107/255.0 alpha:1], [UIColor yellowColor], [UIColor magentaColor], [UIColor blueColor], [UIColor colorWithRed:143/255.0 green:189/255.0 blue:44/255.0 alpha:0.9], [UIColor purpleColor], [UIColor colorWithRed:49/255.0 green:133/255.0 blue:25/255.0 alpha:0.9], [UIColor brownColor], nil];
    
    NSArray *arr1 = [NSArray arrayWithObjects:@"红", @"青", @"橙", @"绿", @"灰", @"黄", @"洋",  @"蓝", @"浅", @"紫", @"草", @"棕",nil];
  
    int n = 0;
    int k = 0;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            
            self.button = [UIButton buttonWithType:UIButtonTypeSystem];
            _button.frame = CGRectMake(15 + 82 * j, 100 + 82 * i, 80, 80);
            _button.backgroundColor = [arr objectAtIndex:n++];
            [_button setTitle:[arr1 objectAtIndex:k++] forState:0];
            [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:_button];
        }
    }
    
    
    return cell;
}

- (void)buttonAction:(UIButton *)button
{

            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"changeColor" object:button.currentTitle];
            BaseColor *manager = [BaseColor baseColor];
            manager.baseColor = button.backgroundColor;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return tableView.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
