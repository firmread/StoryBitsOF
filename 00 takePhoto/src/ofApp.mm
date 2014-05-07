#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	
	
	// register touch events
	ofRegisterTouchEvents(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(127,127,127);
	
	cameraPixels = NULL;
	camera = new firmiOSImagePicker();
	camera->setMaxDimension(480);
    
    status = 0;
}

//--------------------------------------------------------------
void ofApp::update(){

    
#ifndef _USE_SIMULATOR
    //condition to use simulator for testing
	if(camera->imageUpdated){
		//Camera's memory space
		if (cameraPixels == NULL){
			cameraPixels = new unsigned char [camera->width * camera->height*4];
		}
		
        //Now that I'm still upside down camera images, the image upside down
		for (int i = 0; i < camera->height; i++){
			memcpy(cameraPixels+(camera->height-i-1)*camera->width*4, camera->pixels+i*camera->width*4, camera->width*4);
		}
		
		// The captured image from the camera for processing ofImage (photo) Copy
		photo.setFromPixels(cameraPixels, camera->width, camera->height, OF_IMAGE_COLOR_ALPHA);
        camera->imageUpdated = false;
        status = 1;
	}
#endif

}

//--------------------------------------------------------------
void ofApp::draw(){
	
	if (status == 0) {
        //Display the screen to shoot
        ofSetColor(255, 255, 255);
        ofDrawBitmapString("Double tap on the screen!!", 40, ofGetHeight()/2-5);
    }
    
    if(status == 1){
        //Display the captured image
        photo.draw(0, 0);
    }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
	////UNCOMMENT/COMMENT AS NEEDED
	
	////If using Simulator: loading images
	
	//    photo.loadImage("images/photo.png");
	//    photo.setImageType(OF_IMAGE_COLOR_ALPHA);
	//    status = 1;
	
	////or to open Photo library in the simulator or actual device
	
//	camera->openLibrary();
	
	
	//When using real: a new photo shoot
	
    camera->openCamera();

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
