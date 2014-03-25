#include <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>

#define PLIST_PATH @"/User/Library/Preferences/com.insanj.editclockprefs.plist"

BOOL enabled = TRUE;

void settingsUpdated(CFNotificationCenterRef center, void * observer, CFStringRef name, const void * object, CFDictionaryRef userInfo) {
    
    enabled = [[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] objectForKey:@"kEnabled"] ? [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] objectForKey:@"kEnabled"] boolValue] : TRUE; //make it default TRUE
}

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@end

@interface WorldClockViewController : TableViewController
@end

%hook WorldClockViewController

-(UIBarButtonItem *)editButtonItem{
    return enabled ? nil : %orig;
}

-(BOOL)tableView:(UITableView *)arg1 canEditRowAtIndexPath:(NSIndexPath *)arg2{
	return enabled ? YES : %orig;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return enabled ? UITableViewCellEditingStyleDelete : %orig;
}

%end

%ctor {

settingsUpdated(NULL,NULL,NULL,NULL,NULL);

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, settingsUpdated,CFSTR("com.insanj.editclocks.settingsupdated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

}