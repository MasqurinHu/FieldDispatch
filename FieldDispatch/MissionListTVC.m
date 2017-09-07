//
//  MissionListTVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/1.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionListTVC.h"
#import "FieldDispatchDataBase.h"
#import "MissionListTVCell.h"

@interface MissionListTVC ()
{
    NSArray <MissionVO*>*missionList;
}
@end

@implementation MissionListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.estimatedRowHeight = 10;
    
    
    
}


-(void)viewWillAppear:(BOOL)animated {
//    self.navigationController.navigationBarHidden = true;
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    _missionType = self.missionType;
    NSLog(@"\n會出現幾次");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MissionListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MissionListTVCell" forIndexPath:indexPath];
    cell.mission = _array[indexPath.row];
    cell.tvc = self;
    [cell reload];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //設定最高不超過多少
    
    //會報自動尺寸
//        return UITableViewAutomaticDimension;
    return 300;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MissionTVC *missionTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MissionTVC"];
    missionTVC.mission = _array[indexPath.row];
    [self.navigationController pushViewController:missionTVC animated:true];
}

-(void)setMissionType:(MissionType)missionType {
    switch (missionType) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
