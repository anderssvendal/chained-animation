#import "ChainedAnimationStep.h"

@implementation ChainedAnimationStep

@synthesize duration=_duration;
@synthesize animations=_animations;

- (id)initWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations {
    if ((self = [super init])) {
        _duration = duration;
        _animations = animations;
    }
    
    return self;
}

+ (id)chainedAnimationStepWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations {
    return [[ChainedAnimationStep alloc] initWithDuration:duration animations:animations];
}

@end
