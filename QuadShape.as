﻿package {	import flash.display.Sprite;	import flash.geom.Point;		import blocks.BasicBlock;	import blocks.YellowBlock;	import blocks.BlueBlock;	import blocks.GreenBlock;	import blocks.OrangeBlock;	import blocks.PurpleBlock;	import blocks.RedBlock;	import blocks.WhiteBlock;	import blocks.*;				public class QuadShape extends Sprite {		public var degrees:int;		public var shape:Number;		public var color:String;		private var block1:BasicBlock = new BasicBlock();		private var block2:BasicBlock = new BasicBlock();		private var block3:BasicBlock = new BasicBlock();		private var block4:BasicBlock = new BasicBlock();		public var blockArray:Array = [block1, block2, block3, block4];		public function QuadShape() {			shape = Math.random();			degrees = Math.random() * 4;			degrees *=  90;					init();		}						public function init():void {			this.scaleX = .3;			this.scaleY = .3;			addChild(block1);			addChild(block2);			addChild(block3);			addChild(block4);									if (shape < 1/7) {				tShape();			}			else if (shape < 2/7) {				lShape();			}			else if (shape < 3/7) {				oShape();			}			else if (shape < 4/7) {				jShape();			}			else if (shape < 5/7) {				sShape();			}			else if (shape < 6/7) {				zShape();			}			else {				longShape();			}						rotate(degrees);		}		private function rotate(degrees:int):void {			var newX:int;			var newY:int;			if (degrees == 90){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}else if(degrees == 180){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}else if(degrees == 270){				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);				rotate90Degrees(block2);				rotate90Degrees(block3);				rotate90Degrees(block4);							}					}		private function rotate90Degrees(block:Sprite):void{						var newX:int = -block.y;			var newY:int = block.x;			block.x = newX;			block.y = newY;		}		private function longShape():void {			block2.x +=  block2.width;			block3.x +=  block2.width * 2;			block4.x +=  block2.width * 3;		}		private function zShape():void {			sShape();			block2.x *=  -1;			block3.x *=  -1;			block4.x *=  -1;		}		private function sShape():void {			block2.x +=  block2.width;			block3.x +=  block2.width;			block3.y +=  block2.width;			block4.x +=  2 * block2.width;			block4.y +=  block2.width;		}		private function jShape():void {			lShape();			block2.x *=  -1;			block3.x *=  -1;			block4.x *=  -1;		}		private function tShape():void {			block2.x +=  block2.width;			block3.x +=  block2.width;			block3.y +=  block3.height;			block4.x +=  2 * block2.width;		}		private function lShape():void {			block2.y +=  block2.height;			block3.y +=  2 * block2.height;			block4.y +=  3 * block2.height;		}		private function oShape():void {			block2.y +=  block2.height;			block3.x +=  block3.width;			block4.x +=  block3.width;			block4.y +=  block4.height;		}		private function removeBlocks():void {			removeChild(block1);			removeChild(block2);			removeChild(block3);			removeChild(block4);		}		public function yellow():void {			this.color = "yellow";						removeBlocks();			block1 = new YellowBlock() as BasicBlock;			trace("block1===================> ", block1);			addChild(block1);			block2 = new YellowBlock() as BasicBlock;			addChild(block2);			block3 = new YellowBlock() as BasicBlock;			addChild(block3);			block4 = new YellowBlock() as BasicBlock;			addChild(block4);						init();		}		public function red():void {			this.color = "red";			removeBlocks();			block1 = new RedBlock() as BasicBlock;			addChild(block1);			block2 = new RedBlock() as BasicBlock;			addChild(block2);			block3 = new RedBlock() as BasicBlock;			addChild(block3);			block4 = new RedBlock() as BasicBlock;			addChild(block4);			blockArray = [block1, block2, block3, block4];						init();		}		public function blue():void {			this.color = "blue";			removeBlocks();			block1 = new BlueBlock() as BasicBlock;			addChild(block1);			block2 = new BlueBlock() as BasicBlock;			addChild(block2);			block3 = new BlueBlock() as BasicBlock;			addChild(block3);			block4 = new BlueBlock() as BasicBlock;			addChild(block4);			blockArray = [block1, block2, block3, block4];						init();		}		public function blockCoordinates():Array{			var coordinates:Array = new Array();			var xPos:int = 0;			var yPos:int = 0;			//block1			coordinates.push(new Point(xPos, yPos));			//block2			xPos = block2.x/block2.width;			yPos = block2.y/block2.height;			coordinates.push(new Point(xPos, yPos));						//block3			xPos = block3.x/block3.width;			yPos = block3.y/block3.height;			coordinates.push(new Point(xPos, yPos));			//block4			xPos = block4.x/block4.width;			yPos = block4.y/block4.width;			coordinates.push(new Point(xPos, yPos));			blockArray = [block1, block2, block3, block4];					return coordinates;					}		public function updateColors(newBlocks:Array){						block1 = newBlocks[0];			block2 = newBlocks[1];			block3 = newBlocks[2];			block4 = newBlocks[3];						init();		}	}}