//
//  ViewController.h
//  ALUICollectionView
//
//  Created by Arpit Lokwani on 5/2/15.
//  Copyright (c) 2015 Arpit Lokwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;

}

@end

