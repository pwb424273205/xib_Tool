//
//  ButtonClickViewController.m
//  xib_Tool
//
//  Created by 彭文斌 on 2018/6/15.
//  Copyright © 2018年 彭文斌. All rights reserved.
//

#import "ButtonClickViewController.h"

@interface ButtonClickViewController ()
@property (nonatomic,assign) int num;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation ButtonClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickAction:(id)sender {
    _num++;
    _numLabel.text = [NSString stringWithFormat:@"执行第%d次",_num];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
