//
//  NSDictionary+CESafeExt.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/7/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

// Base on https://github.com/kobe1941/FFExtension


#import "NSDictionary+CESafeExt.h"
#import "NSObject+CEHook.h"

@implementation NSDictionary (CESafeExt)

+ (void)load {
    if (self == [NSDictionary class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            @autoreleasepool {

                Class cls = NSClassFromString(@"__NSPlaceholderDictionary");
                [cls cehook_instanceMethodSwizzling:@selector(initWithObjects:forKeys:count:) to:@selector(safe_initWithObjects:forKeys:count:)];

                Class originClass = NSClassFromString(@"NSDictionary");
                [originClass cehook_instanceMethodSwizzling:@selector(writeToURL:error:) to:@selector(safe_writeToURL:error:)];
                [originClass cehook_instanceMethodSwizzling:@selector(initWithObjects:forKeys:) to:@selector(safe_initWithObjects:forKeys:)];
                [originClass cehook_instanceMethodSwizzling:@selector(sharedKeySetForKeys:) to:@selector(safe_sharedKeySetForKeys:)];

                Class mutableClass = NSClassFromString(@"NSMutableDictionary");
                [mutableClass cehook_instanceMethodSwizzling:@selector(sharedKeySetForKeys:) to:@selector(mutable_sharedKeySetForKeys:)];
                [mutableClass cehook_instanceMethodSwizzling:@selector(dictionaryWithSharedKeySet:) to:@selector(safe_dictionaryWithSharedKeySet:)];

                Class classM = NSClassFromString(@"__NSDictionaryM");
                [classM cehook_instanceMethodSwizzling:@selector(removeObjectForKey:) to:@selector(safe_removeObjectForKey:)];
                [classM cehook_instanceMethodSwizzling:@selector(setObject:forKey:) to:@selector(safe_setObject:forKey:)];
                [classM cehook_instanceMethodSwizzling:@selector(setObject:forKeyedSubscript:) to:@selector(safe_setObject:forKeyedSubscript:)];
            }
        });
    }
}

- (instancetype)safe_initWithObjects:(id  _Nonnull const [])objects
                             forKeys:(id<NSCopying>  _Nonnull const [])keys
                               count:(NSUInteger)cnt {
    NSUInteger realCount = 0;
    id realObjects[cnt];
    id realKeys[cnt];
    
    BOOL capture = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (keys && objects && keys[i] && objects[i]) {
            realObjects[realCount] = objects[i];
            realKeys[realCount] = keys[i];
            realCount++;
        } else {
            if (!capture) {
                capture = YES;
                NSUInteger count = cnt > 0 ? (cnt -1) : cnt;
            }
        }
    }
    
    return [self safe_initWithObjects:realObjects forKeys:realKeys count:realCount];
}

- (instancetype)safe_initWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys {
    
    if (objects.count == keys.count) {
        return [self safe_initWithObjects:objects forKeys:keys];
    }
    return nil;
}

- (BOOL)safe_writeToURL:(NSURL *)url error:(NSError * _Nullable __autoreleasing *)error {
    
    if (url) {
        return [self safe_writeToURL:url error:error];
    }
    return NO;
}

+ (id)safe_sharedKeySetForKeys:(NSArray<id<NSCopying>> *)keys {
    
    if (keys) {
        return [self safe_sharedKeySetForKeys:keys];
    }
    return nil;
}

+ (id)mutable_sharedKeySetForKeys:(NSArray<id<NSCopying>> *)keys {
    
    if (!keys) {
        return nil;
    }
    
    return [self mutable_sharedKeySetForKeys:keys];
}

- (void)safe_removeObjectForKey:(id)aKey {
    
    if (aKey) {
        return [self safe_removeObjectForKey:aKey];
    }
    
}

- (void)safe_setObject:(id)anObject forKey:(id)aKey {
    
    if (anObject && aKey) {
        return [self safe_setObject:anObject forKey:aKey];
    }
}

- (void)safe_setObject:(nullable id)obj forKeyedSubscript:(id <NSCopying>)key {
    
    if (key) { // if obj be nil, it will call removeObjectForKey:
        return [self safe_setObject:obj forKeyedSubscript:key];
    }
}

+ (NSMutableDictionary *)safe_dictionaryWithSharedKeySet:(id)keyset {
    
    if (keyset) {
        return [self safe_dictionaryWithSharedKeySet:keyset];
    }
    return nil;
}


@end
