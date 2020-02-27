//
//  SafariExtensionViewController.m
//  MyCodeStyle2 Extension
//
//  Created by Rik Goossens on 26/02/2020.
//  Copyright © 2020 Rik Goossens. All rights reserved.
//

#import "SafariExtensionViewController.h"

#import "AppKit/AppKit.h"


@interface SafariExtensionViewController ()

@end

@implementation SafariExtensionViewController

+ (SafariExtensionViewController *)sharedController {
    static SafariExtensionViewController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[SafariExtensionViewController alloc] init];
        sharedController.preferredContentSize = NSMakeSize(240, 260);
    });
    return sharedController;
}


- (IBAction)checkBoxClicked:(id)sender {
    // TEST:
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Message text"];
    [alert setInformativeText:@"Informative text"];
    [alert addButtonWithTitle:@"OK"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert runModal];
    
    // We should enable/disable the .css depending on checkmark. We can only make this work by using a .js script and
    // sending it a message to turn on/off the .css in wikipedia. Convoluted because the user can simply disable
    // the extension in Preferences.
    // But let's see if we can make it work: try to change e.g. comments to pink by .js when user clicks here.
    //[page dispatchMessageToScriptWithName:@"simpleMessage" userInfo:nil];
    
    //[SFSafariApplication getActiveWindowWithCompletionHandler:(void (^)(SFSafariWindow * _Nullable activeWindow))completionHandler];
}

- (IBAction)buttonClicked:(id)sender {
    // TEST:
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Message text2"];
    [alert setInformativeText:@"Informative text2"];
    [alert addButtonWithTitle:@"OK"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert runModal];
    
    // TODO: open the app
    //[SFSafariApplication openWindowWithURL];
    //NSString url = URL(string: "{app_url_scheme}")

    //[[NSWorkspace shared] open:@""];
    
    // OKOK:
    //if(![[NSWorkspace sharedWorkspace] launchApplication:@"Calculator"])
    //    NSLog(@"Calculator failed to launch");
    
    // Only works if app is in /Applications
    //if(![[NSWorkspace sharedWorkspace] launchApplication:@"MyCodeStyle2"])
    //    NSLog(@"MyCodeStyle2 failed to launch");
    
    NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
    NSURL *url = [NSURL fileURLWithPath:[workspace fullPathForApplication:@"/Users/rg/Library/Developer/Xcode/DerivedData/MyCodeStyle2-dwfsjjljvvaoiaaeajkhhmbrxoqq/Build/Products/Debug/MyCodeStyle2.app"]];
    //Handle url==nil
    NSError *error = nil;
    NSArray *arguments = [NSArray arrayWithObjects:@"Argument1", @"Argument2", nil];
    [workspace launchApplicationAtURL:url options:0 configuration:[NSDictionary dictionaryWithObject:arguments forKey:NSWorkspaceLaunchConfigurationArguments] error:&error];
    //Handle error
    
}


@end
