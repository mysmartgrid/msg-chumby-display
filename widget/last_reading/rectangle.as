﻿class rectangle{		//Definitions 	var _x:Number = 0;	var _y:Number = 0;	var _w:Number = 0;	var _h:Number = 0;	var _i:Number = 0;	var _j:Number = 0;	var _color:Number = 0x0000ff;		public function rectangle() {	// constructor code		}		// Setting all rectangle attributes	public function setAttributes(x:Number, y:Number, w:Number, h:Number, i:Number, j:Number){		_x = x;		_y = y;		_w = w;		_h = h;		_i = i;		_j = j;	}		// Draws the rectangle with the given attributes	public function drawRectangle(mc:MovieClip){		mc.beginFill(_color);		mc.moveTo(_x,_y);		mc.lineTo(_x+_w, _y);		mc.lineTo(_x+_w, _y-_h);		mc.lineTo(_x, _y-_h);		mc.lineTo(_x, _y);		mc.endFill();	}		public function setColor(color:Number) {		_color = color;	}	}	