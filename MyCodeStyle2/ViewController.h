//
//  ViewController.h
//  MyCodeStyle2
//
//  Created by Rik Goossens on 26/02/2020.
//  Copyright © 2020 Rik Goossens. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController


@property (weak, nonatomic) IBOutlet NSTextField * appNameLabel;

- (IBAction)openSafariExtensionPreferences:(id)sender;

@end

