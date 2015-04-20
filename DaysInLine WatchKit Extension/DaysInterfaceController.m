//
//  DaysInterfaceController.m
//  DaysInLine
//
//  Created by Eric Cao on 4/16/15.
//  Copyright (c) 2015 cao yang. All rights reserved.
//

#import "DaysInterfaceController.h"
#import "FMDatabase.h"
#import "rowInterfaceController.h"

@interface DaysInterfaceController ()
{
    int currentMon;
}
@property (nonatomic,strong) FMDatabase *db;

@property (nonatomic,strong) NSMutableArray *allDates;
@property (nonatomic,strong) NSMutableArray *datesInMonth;

@end

@implementation DaysInterfaceController
@synthesize db;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    currentMon = [context intValue];
    [self setTitle:[NSString stringWithFormat:@"%@月",context]];
    

    [self loadDB];
    [self pickDatesOnThisMonth];
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



- (void)loadTableRows {
    
    
    [self.datesTable setNumberOfRows:self.datesInMonth.count withRowType:@"defaultRow"];
    
    [self.backGroup setHeight:37*self.datesInMonth.count];
    
    // Create all of the table rows.
    for (int i = 0; i<self.datesInMonth.count ; i++) {
        
        
        rowInterfaceController *elementRow = [self.datesTable rowControllerAtIndex:i];
        
        [elementRow.rowTitle setText:self.datesInMonth[i]];
    }
}





-(void)loadDB
{
    
    NSURL *storeURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.sheepcao.DaysInLine"];
    NSString *docsPath = [storeURL absoluteString];
    NSString *dbPath = [docsPath stringByAppendingPathComponent:@"info.sqlite"];
    
    db = [FMDatabase databaseWithPath:dbPath];
    
    if (![db open]) {
        NSLog(@"Could not open db.");
        return;
    }
    
    
    self.allDates = [[NSMutableArray alloc] init];
    self.datesInMonth = [[NSMutableArray alloc] init];

    
    FMResultSet *rs = [db executeQuery:@"SELECT DATE from DAYTABLE"];
    while ([rs next]) {
        
        
        NSString *date = [rs stringForColumn:@"DATE"];
        
        [self.allDates addObject:date];
        
      
        
    }
    
    [db close];
}

-(void)pickDatesOnThisMonth
{

    for (NSString *date in self.allDates) {

        NSArray *datas = [date componentsSeparatedByString:@"-"];
        if (datas.count>2) {
          
            if ([datas[1] intValue] == currentMon) {
                [self.datesInMonth addObject:date];
            }
            
        }
    }
    
}

@end



