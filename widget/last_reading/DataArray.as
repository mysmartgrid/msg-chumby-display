﻿class DataArray
{

	var dataArray;
	var _numValues;
	
	public function DataArray(numValues:Number)
	{
		// constructor code
		//trace("dA constructor");
		dataArray = new Array(numValues);
		//trace("length" + dataArray.length);
		_numValues = numValues;
		initArray();
	}

	function initArray()
	{
		//trace("init Array");
		var dal:Number = dataArray.length;
		//trace("length  " + dal);
		
		for (var i:Number = 0; i < dal; i++)
		{
			//trace(i);
			dataArray[i] = 0;
		}
	}


	function max()
	{
		var max:Number = 0;

		for (var i:Number = 0; i < dataArray.length; i++)
		{
			if (dataArray[i] > max)
			{
				max = dataArray[i];
			}
		}
		return max;
	}

	function min()
	{
		var min:Number = dataArray[0];

		for (var i:Number = 1; i < dataArray.length; i++)
		{
			if (dataArray[i] < min)
			{
				min = dataArray[i];
			}
		}
		return min;
	}
	
	public function addValue(val:Number){
		//trace("addValue");
		dataArray.reverse();
		dataArray.pop();
		dataArray.reverse();
		//var help = parseInt(value_reading);
		dataArray.push(val);

	}
	
	public function getDataArray(){
		//trace("da:" +dataArray);
		return dataArray;
	}
	
	public function getNow():Number{
		return dataArray[_numValues - 1];
	}
	// Gibt den Durchschnitt des kompletten DataArrays zurück
	public function average():Number{
		var avg:Number = 0;
		for(var i:Number = 0; i < _numValues; i++){
			avg += dataArray[i];
		}
		avg = Math.round(avg / _numValues);
		return avg;
	}
	// Gibt den Durchschnitt der ersten "num" Zahlen im DataArray zurück
	public function average_number(num:Number):Number{
		var avg:Number = 0;
		for(var i:Number = 0; i <num; i++){
			avg += dataArray[i];
		}
		avg = Math.round(avg / num);
		return avg;
	}
	// Gibt den Durchschnitt von "num" Zahlen ab der Stelle "from" zurück
	public function average_from_to(from:Number, num:Number):Number{
		var avg:Number = 0;
		var help:Number = from + num;
		for(var i:Number = from; i < (help); i++){
			avg += dataArray[i];
		}
		avg = Math.round(avg / num);
		return avg;
	}
	
	public function getMeasure(low:Number,middle:Number,high:Number):Number{
		var help = this.getNow();
		if(help > middle){
			return 3;
		} else if (help < middle && help > low ){
			return 2;
		} else {
			return 1;
		}
	}
}