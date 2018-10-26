#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "Runner-Swift.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*) self.window.rootViewController;
    
    FlutterMethodChannel* nativeChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"flutter.rortega.com.basicchannelcommunication"
                                            binaryMessenger:controller];
    
    [nativeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"showNativeView" isEqualToString: call.method]) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            NativeViewController *nativeViewController = [storyboard instantiateViewControllerWithIdentifier:@"NativeViewControllerId"];
            
            [controller presentViewController:nativeViewController animated:YES completion:^() {}];
             result(@"true");
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
