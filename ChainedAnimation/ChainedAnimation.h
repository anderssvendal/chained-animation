#import <Foundation/Foundation.h>

@interface ChainedAnimation : NSObject

+ (ChainedAnimation*)chainedAnimation;

- (void)addStepWithDuration:(NSTimeInterval)duration animations:(void (^) (void))animations;
- (void)performAnimation;
- (void)performAnimationWithCompletion:(void (^) (void))completion;

@end
