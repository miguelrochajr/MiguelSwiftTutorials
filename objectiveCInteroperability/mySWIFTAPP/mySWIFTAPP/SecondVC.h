//
//  SecondVC.h
//  mySWIFTAPP
//
//  Created by Miguel Silva da Rocha Junior on 7/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRC : UIViewController
- (void) run;

+(NSDictionary*)ReturnNSDict; // The first CRC check
+(NSDictionary*)ReturnNSDictReceiveChar:(char*)c;// The second CRC check

@end
