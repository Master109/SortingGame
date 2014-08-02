//
//  Global.m
//  cocos2d-ios
//
//  Created by Gilead Cosman on 7/2/14.
//
//

#import "Global.h"

@implementation Global
static Global* _sharedMySingleton = nil;

+(Global*)sharedMySingleton
{
    @synchronized([Global class])
    {
        if (!_sharedMySingleton)
            [[self alloc] init];
        
        return _sharedMySingleton;
    }
}

+(id)alloc
{
    @synchronized([Global class])
    {
        //NSAssert(_sharedMySingleton == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedMySingleton = [super alloc];
        return _sharedMySingleton;
    }
    
    return nil;
}

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        
    }
    
    return self;
}

- (CGPoint)VectorSub:(CGPoint)vec1 from:(CGPoint)vec2
{
    return CGPointMake(vec1.x - vec2.x, vec1.y - vec2.y);
}

- (CGPoint)VectorAdd:(CGPoint)vec1 to:(CGPoint)vec2
{
    return CGPointMake(vec1.x + vec2.x, vec1.y + vec2.y);
}

- (CGPoint)VectorMultFloat:(CGPoint)vec1 by:(float)float1
{
    return CGPointMake(vec1.x * float1, vec1.y * float1);
}

- (float)Distance:(CGPoint)vec1 to:(CGPoint)vec2
{
    float xDist = (vec2.x - vec1.x);
    float yDist = (vec2.y - vec1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

@end
