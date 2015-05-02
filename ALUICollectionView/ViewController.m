//
//  ViewController.m
//  ALUICollectionView
//
//  Created by Arpit Lokwani on 5/2/15.
//  Copyright (c) 2015 Arpit Lokwani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical ];
    
    [_collectionView setCollectionViewLayout:flowLayout];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height ) collectionViewLayout:flowLayout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    UINib *cellNib = [UINib nibWithNibName:@"CollectionCustomCell" bundle:nil];
    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"CollectionCustomCell"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];

    [self.view addSubview:_collectionView];

    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    // return number of data count
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CollectionCustomCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageView =(UIImageView*)[cell viewWithTag:102];
    [imageView setImage:[UIImage imageNamed:@"demoImg.jpg"]];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    
    nameLabel.textColor=[UIColor lightGrayColor];
    nameLabel.font=[UIFont systemFontOfSize:10.0];
    nameLabel.text=[NSString stringWithFormat:@"Cell Title %ld",(long)indexPath.row];
    
    
    UILabel *createdDateLabel = (UILabel *)[cell viewWithTag:101];
    createdDateLabel.textColor=[UIColor lightGrayColor];
    createdDateLabel.font=[UIFont systemFontOfSize:10.0];
    createdDateLabel.text=[NSString stringWithFormat:@"Cell Subtitle %ld",(long)indexPath.row];

    
    cell.backgroundColor=[UIColor clearColor];
        return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // set the item size
    return CGSizeMake(self.view.frame.size.width/2-5, self.view.frame.size.width/1.5);
}
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    datasetCell.layer.borderColor = [UIColor clearColor].CGColor; // Default color
    
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // do other stuff on did select 
    NSLog(@"Cell Selected =%ld",(long)indexPath.row);

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
