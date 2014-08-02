//
//  StartScene.m
//  SotringGame
//
//  Created by yahya on 8/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "StartScene.h"

@implementation StartScene





-(void) play
{
    CCScene *MainScene = [CCBReader loadAsScene: @"MainScene"];
    CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:1.f];
    [[CCDirector sharedDirector] replaceScene:MainScene withTransition:transition];
}


@end
