﻿class XmlParse{	// Constants:	public static var CLASS_REF = XmlParse;	var werte:Array = new Array(96);	var zeitwerte:Array = new Array(96);	var value_reading;	var timeXML:XML;	var timeDayXML:XML;	var boundXML:XML;	var baseURL:String = "http://localhost:3000"; //"http://192.168.21.214:3000";	var _high:Number;	var _middle:Number;	var _low:Number;		public function XmlParse()	{		// constructor code		timeXML = new XML();		timeXML.ignoreWhite = true;		// constructor code		timeDayXML = new XML();		timeDayXML.ignoreWhite = true;		boundXML = new XML();		boundXML.ignoreWhite = true;		trace("Loading Boundaries");		boundXML.load(baseURL + "/boundary_values");		// ToDo		// ---> high middel und low aus timeDayXML auslesen und eintragen 	}	public function loadXML()	{		//trace("load");		var dhelp:Date = new Date();		timeXML.load(baseURL + "/last_reading?cachebuster=" + dhelp.getTime());	}	public function loadDayXML()	{		//trace("load Day");		var dhelp:Date = new Date();		timeDayXML.load(baseURL + "/last_day?cachebuster=" + dhelp.getTime());	}		public function setBoundarys(bSuccess:Boolean)	{		//trace("setboundarys 2");		if(bSuccess){			try				{					// Iterate top level					for (var i = 0; i < boundXML.childNodes.length; i++)					{						var inode = boundXML.childNodes[i];						if (inode.nodeName == "consumption")						{							// Evaluate current time. 							for (var j = 0; j < inode.childNodes.length; j++)							{								var jnode = inode.childNodes[j];								//trace("Checking jnode " + jnode.nodeName);								if (jnode.nodeName == "low")								{									_low = parseInt(jnode.childNodes);									//trace("_low: "+_low);								}								if (jnode.nodeName == "mid")								{									_middle = parseInt(jnode.childNodes);									//trace("_middle: "+_middle);								}								if (jnode.nodeName == "high")								{									_high = parseInt(jnode.childNodes);									//trace("_high: "+_high);								}							}						}					}				}				catch (ex)				{					trace(ex.name + ":" + ex.message + ":" + ex.at + ":" + ex.text);				}		}	}		public function parseXML(success:Boolean)	{		//trace("evaluating data.");		if (success)		{			try			{				// Iterate top level				for (var i = 0; i < timeXML.childNodes.length; i++)				{					var inode = timeXML.childNodes[i];										if (inode.nodeName == "current_reading")					{						// Evaluate current time. 						for (var j = 0; j < inode.childNodes.length; j++)						{							var jnode = inode.childNodes[j];							if (jnode.nodeName == "time")							{								var value_timestamp = jnode.childNodes;								//timeStamp.text = value_timestamp;								//timestamp_tfld.text = value_timestamp;								trace("value: "+value_timestamp);							}							if (jnode.nodeName == "reading")							{								value_reading = jnode.childNodes;								trace("reading: "+value_reading);							}						}					}				}			}			catch (ex)			{				trace(ex.name + ":" + ex.message + ":" + ex.at + ":" + ex.text);			}		}		else		{			trace('There is an error with the data.');		}	}		public function fetchLastDay(){	trace("fetch");	try {		trace('got xml document: '+timeDayXML);		// Iterate top level		for (var i=0; i < timeDayXML.childNodes.length; i++) {			var inode = timeDayXML.childNodes[i];			if (inode.nodeName == "last_day") {				for (var j=0; j<inode.childNodes.length; j++) {					var jnode = inode.childNodes[j];					if (jnode.nodeName == "reading") {						for(var k=0; k<jnode.childNodes.length; k++){							var knode = jnode.childNodes[k];							if(knode.nodeName == "value"){								//trace(knode.childNodes);								 var help = (knode.childNodes);								 werte[j] = parseInt(help);							}							if(knode.nodeName == "time"){								zeitwerte[j] = knode.childNodes;															}						}					}				}			}		}	} catch (ex) {		trace(ex.name+":"+ex.message+":"+ex.at+":"+ex.text);		}	}	}