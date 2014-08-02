//
//  MainScene.m
//  cocos2d-ios
//
//  Created by Gilead Cosman on 7/2/14.
//
//

#import "MainScene.h"
#import "Global.h"
#import "Square.h"

@implementation MainScene
static MainScene* _sharedMySingleton = nil;
CGPoint _pTouchLoc;
CGPoint _moveVec;
Global* global;
NSArray* squares;
Square* draggingSquare;


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
    if (draggingSquare != nil)
    {
        s.position = [global VectorAdd:s.position to:_moveVec];
    }
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    for  (Square* s in squares)
    {
        if ([global Distance:s.position to:[touch locationInNode:self]] < 10)
            draggingSquare = s;
    }
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    _moveVec = [global VectorMultFloat:[global VectorSub:[touch locationInNode:self] from:_pTouchLoc] by:60];
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    draggingSquare = nil;
}



@end
