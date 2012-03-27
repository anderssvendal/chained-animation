#import <Foundation/Foundation.h>

@interface ChainedAnimationStep : NSObject

- (id)initWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;
+ (id)chainedAnimationStepWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, copy) void (^animations)(void);

@end
