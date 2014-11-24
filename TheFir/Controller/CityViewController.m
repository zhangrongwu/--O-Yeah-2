//
//  CityViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "CityViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MainAnn.h"


@interface CityViewController () <CLLocationManagerDelegate>

@end

@implementation CityViewController

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
    
//    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"当前位置";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fan.png"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:mapView];
    
    mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D clloc = CLLocationCoordinate2DMake(38.886481, 121.54744);
    
    mapView.region = MKCoordinateRegionMakeWithDistance(clloc, 4000, 4000);
    
    mapView.showsUserLocation = YES;
    
    MainAnn *main = [[MainAnn alloc]init];
    main.title = @"大头针";
    main.subtitle = @"去你妈的";
    main.coordinate = clloc;
    
    [mapView addAnnotation:main];
    [main release];
    [mapView release];
    
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"%@",locations);
    CLLocation * cll= [locations objectAtIndex:0];
    //    cll.coordinate.latitude
    //    cll.coordinate.longitude
    //地理编码
    CLGeocoder * cl = [[CLGeocoder alloc]init];
    [cl reverseGeocodeLocation:cll completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"%@",placemarks);
    }];
    [manager stopUpdatingLocation];
    
}


- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];

    
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
