//
//  SouViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-15.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "SouViewController.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "ThirdFiveViewController.h"

@interface SouViewController ()

@property (nonatomic, retain)NSMutableArray *arr1;

@end

@implementation SouViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.dataArray = [NSMutableArray array];
        self.data2Array = [NSMutableArray array];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"搜索资讯";
    
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    mySearchBar.delegate = self;
    [mySearchBar setPlaceholder:@"搜索列表"];
    
    searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:mySearchBar contentsController:self];
    searchDisplayController.active = NO;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
	self.tableView.tableHeaderView = mySearchBar;
    
    [self.view addSubview:_tableView];
    
    
    //本地沙盒地址
    //    NSString *benpath = @"/Users/dlios/Library/Application Support/iPhone Simulator/7.1/Applications/3C3B01AC-90F2-4907-8C96-CDE6A0F0A327/Documents/apiBlockSorts.plist";
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"apiBlockSorts" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.arr1 = [NSMutableArray array];
    
    _arr1 = [dic objectForKey:@"_root"];
    
    for (int i = 0; i < 9; i++) {
        for (NSDictionary *dic in [[_arr1 objectAtIndex:i]objectForKey:@"sons"]) {
            NSString *str = [dic objectForKey:@"block_title"];
            NSString *str1 = [dic objectForKey:@"api_url"];
            [_dataArray addObject:str];
            [_data2Array addObject:str1];
        }
    }

    [_data2Array mutableCopy];
    [_dataArray mutableCopy];


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return searchResults.count;
    }
    
    else {
        return _dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = searchResults[indexPath.row];
    }
    
    else {
        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThirdFourViewController *four = [[ThirdFourViewController alloc]init];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {

        NSString *str = searchResults[indexPath.row];
        
        for (int i = 0; i < _dataArray.count; i++) {
            if ([str isEqualToString:[_dataArray objectAtIndex:i]]) {
                four.str = [_data2Array objectAtIndex:i];
            }
        }

    }
    
    else {
        four.str = [_data2Array objectAtIndex:indexPath.row];
    }
    
    [self presentViewController:four animated:YES completion:^{
        
    }];
}



#pragma UISearchDisplayDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    int a = 0;
    searchResults = [[NSMutableArray alloc]init];
    if (mySearchBar.text.length>0&&![ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
        for (int i=0; i<_dataArray.count; i++) {
            if ([ChineseInclude isIncludeChineseInString:_dataArray[i]]) {
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:_dataArray[i]];
                NSRange titleResult=[tempPinYinStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:_dataArray[i]];
                    a++;
                }
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:_dataArray[i]];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    if (a == 0) {
                           [searchResults addObject:_dataArray[i]];
                    }
                 
                }
            }
            


            else {
                NSRange titleResult=[_dataArray[i] rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:_dataArray[i]];
                }
            }
        }
    } else if (mySearchBar.text.length>0&&[ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
        for (NSString *tempStr in _dataArray) {
            NSRange titleResult=[tempStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [searchResults addObject:tempStr];
            }
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.frame = CGRectMake(-320, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView animateWithDuration:0.7 animations:^{
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    } completion:^(BOOL finished) {
        ;
    }];
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
