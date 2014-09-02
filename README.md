Purpose
=======
DIRIMOTE is a technology for software developers and creative agencies. It turns every smartphone into a versatile ad-hoc remote control. By scanning a code on another device, it instantly connects to it and displays all required input elements.

DIRIMOTE is a perfect add-on for all kind of public displays and terminals, without need for other input periphery. But you can also use it for every other purpose you might think of; as long as your device is connected to the internet, you can make it controllable with DIRIMOTE.

The DIRIMOTE SDK for developers provides easy to use classes and methods to get DIRIMOTE functionality into your own applications.

The Adobe Flash SDK can be used in FlashDevelop, FlashBuilder, Adobe Flash Professional CC and any other Flash IDE that supports SWC libs. It allows the creation of event applications running on Windows, Mac and Linux machines. Further SDKs supporting additional languages and frameworks are already in development.

For a more detailed description please visit:
http://www.dirimote.com/developer


Getting started
===============
DIRIMOTE is incredibly easy to set up. Just follow these three steps below and you're ready to go:

1. Clone or Download the FREE DIRIMOTE SDK
2. Import flash/lib/libDirimote.swc into your project
3. [Get a DIRIMOTE App ID here](http://www.dirimote.com/member)

Hello World
==============
Using the DIRIMOTE SDK is as simple as this:

```as3
dirimote= new Dirimote(APP_ID);
```
Create a new Dirimote object.

```as3
controller= dirimote.createController(new DirimoteInterfaceLayout("default"));
```
Create a Controller object.

```as3
controller.addEventListener(DirimoteController.EVENT_INTERACTION, onInteraction);
```
Start listening to interaction data, sent by remote controllers.

```as3
stage.addChild(controller.qrcode);
```
Display the session DIRI-Code somewere visible at your stage.



Complete HelloDirimote example (take a look at *flash/Examples* for more.):
```as3
package com.at2.dirimote.examples.HelloDirimote
{
	import com.at2.dirimote.receiver.*;
	import com.at2.dirimote.common.*;
	
	import flash.display.Sprite;
	import flash.events.Event;

	public class Main extends Sprite 
	{

		//register an App on http://www.dirimote.com/
		//and get an APP_ID for your application
		private const APPID:String = "MY_APP_ID"; 
		
		private var dirimote:Dirimote 		 = null;
		private var controller:DirimoteController= null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			dirimote  = new Dirimote(APPID);
			controller= dirimote.createController(new DirimoteInterfaceLayout("default"));
			controller.addEventListener(DirimoteController.EVENT_INTERACTION, onControllerInteraction);
			
			stage.addChild(controller.qrcode);
		}
		
		private function onControllerInteraction(e:Object):void {

			if(e.id== DirimoteActions.DIRIMOTE_ACTION_A){
			
				trace('Hello World!');
			}
		}
	}
}
```
For a more detailed documentation please visit:
http://www.dirimote.com/documentation


