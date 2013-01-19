﻿package {	import flash.display.Sprite;	import flash.geom.Point;				public class QuadShape extends Sprite {		public var main:Prototype;		public var degrees:int;		public var shape:Number;		public var color:String;		private var block1:BasicBlock = new BasicBlock();		private var block2:BasicBlock = new BasicBlock();		private var block3:BasicBlock = new BasicBlock();		private var block4:BasicBlock = new BasicBlock();		public var blockArray:Array = [block1, block2, block3, block4];		public function QuadShape(main:Prototype) {			this.main = main;			this.mouseChildren = false;			this.mouseEnabled = false;			shape = Math.random();			degrees = Math.random() * 4;			degrees *=  90;					init();		}						public function init():void {			this.scaleX = .3;			this.scaleY = .3;						for (var i:uint =0; i < 4; i++){				addChild(blockArray[i]);				blockArray[i].scaleX *= main.blockSize/blockArray[i].width;				blockArray[i].scaleY *= main.blockSize/blockArray[i].height;			}			addChild(block1);			addChild(block2);			addChild(block3);			addChild(block4);												if (shape < 1/7) {				tShape();			}			else if (shape < 2/7) {				lShape();			}			else if (shape < 3/7) {				oShape();			}			else if (shape < 4/7) {				jShape();			}			else if (shape < 5/7) {				sShape();			}			else if (shape < 6/7) {				zShape();			}			else {				longShape();			}			rotate(degrees);			positionBlocks();		}		public function rotateHit():void{			degrees = (degrees + 90)%360;			init();		}		public function rotate(degrees:int):void {			var newX:int;			var newY:int;			if (degrees == 90){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}else if(degrees == 180){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}else if(degrees == 270){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}					}		private function rotate90Degrees(block:BasicBlock):void{			var newBoardX:int = -block.boardY;			var newBoardY:int = block.boardX;			block.boardX = newBoardX;			block.boardY = newBoardY;		}		private function longShape():void {			block2.boardX = 1;			block3.boardX = 2;			block4.boardX = 3;		}		private function zShape():void {			sShape();			block2.boardX *= -1;			block3.boardX *= -1;			block4.boardX *= -1;		}		private function sShape():void {			block2.boardX = 1;			block3.boardX = 1;			block3.boardY = 1;			block4.boardX = 2;			block4.boardY = 1;		}		private function jShape():void {			lShape();			block2.boardX *= -1;			block3.boardX *= -1;			block4.boardX *= -1;		}		private function tShape():void {			block2.boardX = 1;			block3.boardX = 1;			block3.boardY = 1;			block4.boardX = 2;		}		private function lShape():void {			block2.boardY = 1;			block3.boardY = 2;			block4.boardY = 3;		}		private function oShape():void {			block2.boardY = 1;			block3.boardY = 1;			block4.boardX = 1;			block4.boardX = 1;					}		private function positionBlocks():void{			block2.x = block2.boardX*main.blockSize;			block2.y = block2.boardY*main.blockSize;			block3.x = block3.boardX*main.blockSize;			block3.y = block3.boardY*main.blockSize;			block4.x = block4.boardX*main.blockSize;			block4.y = block4.boardY*main.blockSize;		}		private function removeBlocks():void {			removeChild(block1);			removeChild(block2);			removeChild(block3);			removeChild(block4);		}		public function yellow():void {			this.color = "yellow";			removeBlocks();			block1 = new YellowBlock();			addChild(block1);			block2 = new YellowBlock();			addChild(block2);			block3 = new YellowBlock();			addChild(block3);			block4 = new YellowBlock();			addChild(block4);						init();		}		public function red():void {			this.color = "red";			removeBlocks();			block1 = new RedBlock();			addChild(block1);			block2 = new RedBlock();			addChild(block2);			block3 = new RedBlock();			addChild(block3);			block4 = new RedBlock();			addChild(block4);			blockArray = [block1, block2, block3, block4];						init();		}		public function blue():void {			this.color = "blue";			removeBlocks();			block1 = new BlueBlock();			addChild(block1);			block2 = new BlueBlock();			addChild(block2);			block3 = new BlueBlock();			addChild(block3);			block4 = new BlueBlock();			addChild(block4);			blockArray = [block1, block2, block3, block4];									init();		}		public function blockCoordinates():Array{			var coordinates:Array = new Array();						//block1			coordinates.push(new Point(block1.boardX, block1.boardY));			//block2			coordinates.push(new Point(block2.boardX, block2.boardY));			//block3			coordinates.push(new Point(block3.boardX, block3.boardY));			//block4			coordinates.push(new Point(block4.boardX, block4.boardY));					return coordinates;					}		public function updateColors(newBlocks:Array){						block1 = newBlocks[0];			block2 = newBlocks[1];			block3 = newBlocks[2];			block4 = newBlocks[3];						init();		}	}}