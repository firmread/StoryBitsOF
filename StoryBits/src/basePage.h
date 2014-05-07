//
//  basePage.h
//  StoryBits
//
//  Created by Firm Read on 5/7/14.
//
//

#ifndef StoryBits_basePage_h
#define StoryBits_basePage_h

#include "ofMain.h"

class basePage{
    virtual void setup(){};
    virtual void update(){};
    virtual void draw(){};
    
    virtual void touchDown(ofTouchEventArgs & touch){};
    virtual void touchMoved(ofTouchEventArgs & touch){};
    virtual void touchUp(ofTouchEventArgs & touch){};
    virtual void touchDoubleTap(ofTouchEventArgs & touch){};
    virtual void touchCancelled(ofTouchEventArgs & touch){};
    
};



#endif
