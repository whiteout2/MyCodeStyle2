//
//  SafariExtensionHandler.m
//  MyCodeStyle2 Extension
//
//  Created by Rik Goossens on 26/02/2020.
//  Copyright © 2020 Rik Goossens. All rights reserved.
//

#import "SafariExtensionHandler.h"
#import "SafariExtensionViewController.h"

#import "AppKit/AppKit.h"


@interface SafariExtensionHandler ()

@end

// MyCodeView2: Be as bold as Bjarne!
// Use whatever code style you want on Wikipedia

// TODO:
// * toolbar icon without clipping
// * handle checkbox and URL detection
// * per page activity
// * colors and italics/bold and font

@implementation SafariExtensionHandler

- (void)messageReceivedWithName:(NSString *)messageName fromPage:(SFSafariPage *)page userInfo:(NSDictionary *)userInfo {
    // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
    [page getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties *properties) {
        NSLog(@"The extension received a message (%@) from a script injected into (%@) with userInfo (%@)", messageName, properties.url, userInfo);
    }];
}

- (void)toolbarItemClickedInWindow:(SFSafariWindow *)window {
    // This method will be called when your toolbar item is clicked.
    NSLog(@"The extension's toolbar item was clicked");
    
}



- (void)popoverWillShowInWindow:(SFSafariWindow *)window {
   // This is called when the extension's popover is about to be opened.
   // TODO: set url label to the current site
    
   // TEST:
//   NSAlert *alert = [[NSAlert alloc] init];
//   [alert setMessageText:@"Message text."];
//   [alert setInformativeText:@"Informative text."];
//   [alert addButtonWithTitle:@"OK"];
//   [alert addButtonWithTitle:@"Cancel"];
//   [alert runModal];
    
    [window getActiveTabWithCompletionHandler:^(SFSafariTab *activeTab) {
        [activeTab getActivePageWithCompletionHandler:^(SFSafariPage *page) {
            [page getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties *properties) {
                // Now you can use "properties" in viewController using shareObject
            }];
        }];
    }];
    
}


- (void)validateToolbarItemInWindow:(SFSafariWindow *)window validationHandler:(void (^)(BOOL enabled, NSString *badgeText))validationHandler {
    // This method will be called whenever some state changes in the passed in window. You should use this as a chance to enable or disable your toolbar item and set badge text.
    validationHandler(YES, nil);
}

- (SFSafariExtensionViewController *)popoverViewController {
    // Show a popover
    return [SafariExtensionViewController sharedController];
}


@end
