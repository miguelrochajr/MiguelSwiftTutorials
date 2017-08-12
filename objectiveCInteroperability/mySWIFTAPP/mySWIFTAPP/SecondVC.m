//
//  SecondVC.m
//  mySWIFTAPP
//
//  Created by Miguel Silva da Rocha Junior on 7/3/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

#import "SecondVC.h"
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

@interface CRC ()

@end

@implementation CRC

+(NSDictionary*)ReturnNSDict {
    
    NSNumber *age= [NSNumber numberWithInt:40];
    NSNumber *age2= [NSNumber numberWithInt:44];
    
    NSDictionary *dict = @{@"OriginalData": age, @"EncryptedData": age2};
    return dict;

}

+(NSDictionary*)ReturnNSDictReceiveChar:(char *)c {
    
    NSNumber *age= [NSNumber numberWithInt:40];
    NSNumber *age2= [NSNumber numberWithInt:44];
    //NSNumber *myNumb= [NSNumber numberWithChar:c[0]];
    
    NSLog(@"CRC_secondCheck RECEIVED VALUE %d", c[1]);
    
    NSDictionary *dict = @{@"OriginalData": age, @"EncryptedData": age2};
    return dict;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) run {
    NSLog(@"This is from my Objective-C class!!!");
}

@end
