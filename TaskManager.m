#import "TaskManager.h"

@implementation TaskManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _tasks = [NSMutableArray array];
    }
    return self;
}

- (void)addTask:(NSString *)task {
    [self.tasks addObject:task];
}

- (void)removeTaskAtIndex:(NSInteger)index {
    [self.tasks removeObjectAtIndex:index];
}

@end
