//
//  ViewController.m
//  PrintFont
//
//  Created by 老板 on 16/7/4.
//  Copyright © 2016年 老板. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
{
    UITableView *table;
    NSArray *font;
}

@end

@implementation ViewController

static NSString *ident = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    font = [UIFont familyNames];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [font count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *fontNames = [UIFont fontNamesForFamilyName:(NSString *)[font objectAtIndex:section]];
    return [fontNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    NSArray *fontNames = [UIFont fontNamesForFamilyName:(NSString *)[font objectAtIndex:indexPath.section]];
    cell.textLabel.text = [NSString stringWithFormat:@"我是字体%@",(NSString *)[fontNames objectAtIndex:indexPath.row]];
    cell.textLabel.font = [UIFont fontWithName:(NSString *)[fontNames objectAtIndex:indexPath.row] size:15];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
