#import <Preferences/Preferences.h>

@interface EditClocksPrefsListController: PSListController {
}
@end

@implementation EditClocksPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"EditClocksPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
