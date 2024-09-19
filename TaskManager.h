#import <Foundation/Foundation.h>

@interface TaskManager : NSObject

@property (nonatomic, strong) NSMutableArray *tasks;

- (void)addTask:(NSString *)task;
- (void)removeTaskAtIndex:(NSInteger)index;

@end
