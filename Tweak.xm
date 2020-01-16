@interface MFMailComposeController
- (void)send:(id)arg1;
@end

%hook MFMailComposeController
- (void)send:(id)arg1 {
	NSString *email = MSHookIvar<NSString *>(self, "_sendingEmailAddress");
	NSString *msg = [NSString stringWithFormat:@"You are about to send an email as %@\nAre you sure?", email];
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
