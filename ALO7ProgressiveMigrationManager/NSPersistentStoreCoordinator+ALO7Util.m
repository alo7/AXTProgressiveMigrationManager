//
//  NSPersistentStoreCoordinator+ALO7Util.m
//
//  Created by Andrew Urban on 8/5/16.
//
//

#import "NSPersistentStoreCoordinator+ALO7Util.h"

@implementation NSPersistentStoreCoordinator (ALO7Util)

+ (nullable NSDictionary<NSString *, id> *)getMetadataForPersistentStoreOfType:(NSString*)storeType URL:(NSURL *)storeURL options:(nullable NSDictionary *)options error:(NSError **)errorPtr
{
    NSMutableDictionary *readOnlyOptions = [NSMutableDictionary dictionaryWithDictionary:options];
    readOnlyOptions[NSReadOnlyPersistentStoreOption] = @YES;
    NSValue *storeClassValue = [NSPersistentStoreCoordinator registeredStoreTypes][storeType];
    if (!storeClassValue) {
        *errorPtr = [NSError errorWithDomain:NSCocoaErrorDomain code:NSPersistentStoreInvalidTypeError userInfo:nil];
        return nil;
    }
    Class StoreClass = storeClassValue.pointerValue;
    NSPersistentStore *store = [[StoreClass alloc] initWithPersistentStoreCoordinator:nil
                                                                    configurationName:nil
                                                                                  URL:storeURL
                                                                              options:readOnlyOptions];
    BOOL metadataLoadingResult = [store loadMetadata:errorPtr];
    if (!metadataLoadingResult) {
        return nil;
    }
    return store.metadata;
}

@end
