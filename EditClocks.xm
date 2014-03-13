#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@end

@interface WorldClockViewController : TableViewController
@end

%hook WorldClockViewController

-(UIBarButtonItem *)editButtonItem{
    return nil;
}

-(BOOL)tableView:(UITableView *)arg1 canEditRowAtIndexPath:(NSIndexPath *)arg2{
	return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

%end
