//
//  MonthInterfaceController.m
//  DaysInLine
//
//  Created by Eric Cao on 4/16/15.
//  Copyright (c) 2015 cao yang. All rights reserved.
//

#import "MonthInterfaceController.h"
#import "rowInterfaceController.h"

@interface MonthInterfaceController ()

@end

@implementation MonthInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self loadTableRows];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    
    [self pushControllerWithName:@"DaysInterfaceController" context:[NSNumber numberWithInteger:(rowIndex+1)]];
}

- (void)loadTableRows {
    
    
    [self.monthTable setNumberOfRows:12 withRowType:@"defaultRow"];
    
    
    // Create all of the table rows.
    for (int i = 0; i<12; i++) {
    
   
        rowInterfaceController *elementRow = [self.monthTable rowControllerAtIndex:i];
        
        [elementRow.rowTitle setText:[NSString stringWithFormat:@"%d月",i+1]];
     }
}


@end



