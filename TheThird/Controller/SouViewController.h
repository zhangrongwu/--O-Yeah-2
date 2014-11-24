//
//  SouViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-15.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"
#import "ThirdFourViewController.h"

@interface SouViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>{
    
    NSMutableArray *searchResults;
    UISearchBar *mySearchBar;
    UISearchDisplayController *searchDisplayController;
    
}

@property (nonatomic, retain)NSMutableArray *dataArray;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *data2Array;


@end
