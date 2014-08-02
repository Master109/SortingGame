//
//  Global.h
//  cocos2d-ios
//
//  Created by Gilead Cosman on 7/2/14.
//
//

#import <Foundation/Foundation.h>

@interface Global : NSObject
{
    
}

@property(readwrite, assign) CCNode *player;
@property(readwrite, assign) int screenWidth;
@property(readwrite, assign) int screenHeight;
@property(nonatomic, strong) CCPhysicsNode* physicsNode;

+(Global*)sharedMySingleton;
- (CGPoint)VectorSub:(CGPoint)vec1 from:(CGPoint)vec2;
- (CGPoint)VectorAdd:(CGPoint)vec1 to:(CGPoint)vec2;
- (CGPoint)VectorMultFloat:(CGPoint)vec1 by:(float)float1;
- (float)Distance:(CGPoint)vec1 to:(CGPoint)vec2;

@end
