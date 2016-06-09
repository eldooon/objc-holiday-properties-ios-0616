//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *holidays = self.database[season];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSArray *supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season {
    
    if ([self.database[season] objectForKey: holiday]){
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    if ([self.database[season][holiday] containsObject: supply]){
        return YES;
    }
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    [self.database[season] setValue:@"" forKey:holiday];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season] setValue:supply forKey:holiday];
}

@end
