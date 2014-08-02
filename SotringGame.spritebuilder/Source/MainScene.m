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
NSMutableArray* squares;
Square* draggingSquare;
CCNode *square;


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
    squares = [[NSMutableArray alloc] initWithCapacity:0];
    [squares addObject:[self getChildByName:@"Square" recursively:TRUE]];
}
    
-(void)update:(CCTime)delta
{
    if (draggingSquare != nil)
    {
        NSLog(@"1");
        [draggingSquare.physicsBody applyImpulse:_moveVec];
    }
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    for  (Square* s in squares)
    {
        if ([global Distance:s.positionInPoints to:[touch locationInWorld]] < 40)
        {
            draggingSquare = s;
            //NSLog(@"1");
        }
    }
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    _moveVec = [global VectorMultFloat:[global VectorSub:[touch locationInNode:self] from:_pTouchLoc] by:2000000000000];
    _pTouchLoc = [touch locationInNode:self];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    draggingSquare = nil;
}

@end
