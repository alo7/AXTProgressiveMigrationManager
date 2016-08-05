//
//  NSPersistentStoreCoordinator+ALO7Util.h
//
//  Created by Andrew Urban on 8/5/16.
//
//

#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator (ALO7Util)

+ (nullable NSDictionary<NSString *, id> *)getMetadataForPersistentStoreOfType:(NSString*)storeType URL:(NSURL *)storeURL options:(nullable NSDictionary *)options error:(NSError **)errorPtr;

@end
