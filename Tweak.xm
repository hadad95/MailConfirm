#import <Cephei/HBPreferences.h>

@interface MFMailComposeController
- (void)sendMessage;
- (void)send:(id)arg1;
- (id)sendingEmailAddress;
@end

BOOL enabled;

%hook MFMailComposeController
- (void)sendMessage {
	NSLog(@"result = %@", [self sendingEmailAddress]);
	if (!enabled) {
		%orig;
		return;
	}
	
	NSString *email = MSHookIvar<NSString *>(self, "_sendingEmailAddress");
	NSString *msg = [NSString stringWithFormat:@"You are about to send an email with the following account:\n%@\n\nAre you sure?", email];
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Sending"
		message:msg
		preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
		handler:^(UIAlertAction * action) { %orig; }];

	UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
		handler:^(UIAlertAction * action) {}];

	[alert addAction:yesButton];
	[alert addAction:noButton];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alert animated:YES completion:nil];
}
%end

%ctor {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.kef.mailconfirm"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
}
