//
//  MainScene.m
//  cocos2d-ios
//
//  Created by Gilead Cosman on 7/2/14.
//
//

#import "MainScene.h"
#import "Global.h"

@implementation MainScene
static MainScene* _sharedMySingleton = nil;
CGPoint _pTouchLoc;
CGPoint _moveVec;
Global* global;

+(MainScene*)sharedMySingleton
{
    @synchronized([MainScene class])
    {
        if (!_sharedMySingleton)
            [[self alloc] init];
        
        return _sharedMySingleton;
    }
}

+(id)alloc
{
    @synchronized([MainScene class])
    {
        _sharedMySingleton = [super alloc];
        return _sharedMySingleton;
    }
    
    return nil;
}

- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
    }
    return self;
}

- (void)didLoadFromCCB
{
    global = [Global sharedMySingleton];
}
    
-(void)update:(CCTime)delta
{
    
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    _moveVec = [global VectorSub:[touch locationInNode:self] from:_pTouchLoc];
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

@end
