#import "ChainedAnimation.h"
#import "ChainedAnimationStep.h"

@interface ChainedAnimation ()

- (void)performNextAnimationStep;
- (void)animiationFinished;

@property (nonatomic, strong) NSMutableArray *animationSteps;
@property (nonatomic, copy) void (^completionBlock)(void);
@property (nonatomic, assign) NSUInteger currentAnimation;

@end

@implementation ChainedAnimation

@synthesize animationSteps=_animationSteps;
@synthesize completionBlock=_completionBlock;
@synthesize currentAnimation=_currentAnimation;

- (id)init {
    if ((self = [super init])) {
        _animationSteps = [NSMutableArray array];
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"ChainedAnimation dealloc");
}

+ (ChainedAnimation*)chainedAnimation {
    return [[ChainedAnimation alloc] init];
}

- (void)addStepWithDuration:(NSTimeInterval)duration animations:(void (^) (void))animations {
    [_animationSteps addObject:[ChainedAnimationStep chainedAnimationStepWithDuration:duration animations:animations]];
}

- (void)performAnimation {
    [self performAnimationWithCompletion:nil];
}

- (void)performAnimationWithCompletion:(void (^) (void))completion {
    _completionBlock = completion;
    _currentAnimation = 0;
    [self performNextAnimationStep];
}

- (void)performNextAnimationStep {
    if (_currentAnimation >= [_animationSteps count]) {
        [self animiationFinished];
        return;
    }

    ChainedAnimationStep *animationStep = [_animationSteps objectAtIndex:_currentAnimation];
    NSLog(@"performing animation step with duration: %f", animationStep.duration);
    [UIView animateWithDuration:animationStep.duration 
                          delay:0.0 
                        options:UIViewAnimationOptionCurveLinear 
                     animations:animationStep.animations 
                     completion:^(BOOL finished) {
                         if (finished) {
                             NSLog(@"animationFinished");
                             [self performNextAnimationStep];
                         }
                     }];
    _currentAnimation++;
}

- (void)animiationFinished {
    if (_completionBlock) {
        _completionBlock();
    }
}

@end
