//
//  LeftVC.m
//  LiXinDriverTest
//
//  Created by lixin on 16/11/6.
//  Copyright © 2016年 陆遗坤. All rights reserved.
//

#import "LeftVC.h"

@interface LeftVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrayData;
@property (nonatomic, strong) NSMutableArray *arrayIMG;

@property (nonatomic, strong) PublicTool *tool;

@end

@implementation LeftVC

-(NSMutableArray *)arrayData{
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}
-(NSMutableArray *)arrayIMG{
    if (!_arrayIMG) {
        _arrayIMG = [NSMutableArray array];
    }
    return _arrayIMG;
}

-(PublicTool *)tool{
    if (!_tool) {
        _tool =[PublicTool shareInstance];
    }
    return _tool;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(MATCHSIZE(0), MATCHSIZE(0), MATCHSIZE(550), VIEW_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = MATCHSIZE(80);
        _tableView.backgroundColor = DEFAULT_COLOR2;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatTableView];
    
    
    
}

-(void)creatTableView{
    
    [self.arrayData addObjectsFromArray:@[@"信息栏",@"我的订单",@"我的业绩",@"消息通知",@"出行热点",@"司机指南",@"离线地图",@"紧急救援",@"我的客服"]];
    
    //    [self.arrayIMG addObjectsFromArray:@[@"info",@"DD",@"YJ",@"xx",@"RD",@"ZN",@"DT",@"JY",@"KF"]];
    [self.arrayIMG addObjectsFromArray:@[@"main",@"main",@"main",@"main",@"main",@"main",@"main",@"main",@"main"]];
    
    self.tableView.sectionHeaderHeight = MATCHSIZE(300);
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.scrollEnabled = NO; //设置tableview 不能滚动
    
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark tableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrayData.count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.backgroundColor = DEFAULT_COLOR2;
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    cell.imageView.image = [self.tool scaleToSize:[UIImage imageNamed:self.arrayIMG[indexPath.row]] size:CGSizeMake(MATCHSIZE(60), MATCHSIZE(60))];
    
    cell.textLabel.text = self.arrayData[indexPath.row];
    
    [cell.textLabel setTextColor:RGBAlpha(255, 255, 255, 1)];
    
    return cell;
}
// 头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    LeftHeaderUserCell *cell = [[LeftHeaderUserCell alloc] init];
    
    [cell onClickWithBlcok:^(UIButton *btn) {
        //关闭左侧栏
        [self closeLeftView];
        
    }];
    
    return cell;
}

//点击跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    //信息栏
    if (indexPath.row == 0) {
        
    }
    
    //我的订单
    else if (indexPath.row == 1) {
        
    }
    //我的业绩
    else if (indexPath.row == 2) {
        
    }
    //消息通知
    else if (indexPath.row == 3) {
        
    }
    //出行热点
    else if (indexPath.row == 4) {
        
    }
    //司机指南
    else if (indexPath.row == 5) {
        
    }
    //离线地图
    else if (indexPath.row == 6) {
        
        AlertView *alertView = [AlertView shareInstanceWithFrame:[UIScreen mainScreen].bounds AndAddAlertViewType:AlertViewTypeGetDownLoad];
        [alertView alertViewShow];

    }
    
    //紧急救援
    else if (indexPath.row == 7) {
        
    }
    //我的客服
    else if (indexPath.row == 8) {
        
    }
    
    //关闭左侧栏
    [self closeLeftView];
    
    NSLog(@"leftItem 点击了 %ld",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
