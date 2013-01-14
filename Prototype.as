﻿package {	import flash.display.MovieClip;	import flash.display.Sprite;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.geom.Point;		import blocks.BasicBlock;	import blocks.BlueBlock;	import blocks.GreenBlock;	import blocks.OrangeBlock;	import blocks.PurpleBlock;	import blocks.RedBlock;	import blocks.WhiteBlock;	import blocks.YellowBlock;	public class Prototype extends MovieClip {		//player piece		public var currentPiece:QuadShape;		public var holdingPiece:Boolean;		public var playBoard:PlayBoard;		//if the player piece in on the Board		public var onBoard:Boolean = false;		public var boardCols:int;		public var boardRows:int;		public var blockSize:int;				public var yellow_chooser:Sprite;		public var red_chooser:Sprite;		public var blue_chooser:Sprite;		public function Prototype() {			addEventListener(Event.ADDED_TO_STAGE, init);		}						public function init(evt:Event):void{			removeEventListener(Event.ADDED_TO_STAGE, init);			currentPiece = new QuadShape();			holdingPiece = false;						boardCols = 5;			boardRows = 5;			playBoard = new PlayBoard(this, boardCols, boardRows);			addChild(playBoard);						makeColorChoosers();						addEventListener(Event.ENTER_FRAME, update);					}		function update(evt:Event):void {		}		function spawnBlock(evt:MouseEvent):void {			//user is holding a piece			holdingPiece = true;						playBoard.dropReady();						addEventListener(MouseEvent.MOUSE_UP, dropBlock);									addChild(currentPiece);						currentPiece.x = playBoard.x;			currentPiece.y = playBoard.y;								}		function dropBlock(evt:Event):void {						removeEventListener(MouseEvent.MOUSE_UP, dropBlock);						holdingPiece = false;			playBoard.dropPiece(currentPiece);			removeChild(currentPiece);			currentPiece = new QuadShape();		}				public function makeColorChoosers():void{			yellow_chooser = new Sprite();			yellow_chooser.x = playBoard.x - 40;			yellow_chooser.y = playBoard.y;			yellow_chooser.graphics.beginFill(0xffff00, 1);			yellow_chooser.graphics.drawRect(0, 0, 20, playBoard.height);			yellow_chooser.addEventListener(MouseEvent.MOUSE_DOWN, spawnBlock);			yellow_chooser.addEventListener(MouseEvent.MOUSE_OVER, yellowBlock);			addChild(yellow_chooser);						blue_chooser = new Sprite();			blue_chooser.x = playBoard.x + playBoard.width + 20;			blue_chooser.y = playBoard.y;			blue_chooser.graphics.beginFill(0x0000ff, 1);			blue_chooser.graphics.drawRect(0, 0, 20, playBoard.height);			blue_chooser.addEventListener(MouseEvent.MOUSE_DOWN, spawnBlock);			blue_chooser.addEventListener(MouseEvent.MOUSE_OVER, blueBlock);			addChild(blue_chooser);						red_chooser = new Sprite();			red_chooser.x = playBoard.x;			red_chooser.y = playBoard.y - 40;			red_chooser.graphics.beginFill(0xFF0000, 1);			red_chooser.graphics.drawRect(0, 0, playBoard.width, 20);			red_chooser.addEventListener(MouseEvent.MOUSE_DOWN, spawnBlock);			red_chooser.addEventListener(MouseEvent.MOUSE_OVER, redBlock);			addChild(red_chooser);		}				public function yellowBlock(evt:Event):void{			currentPiece.yellow();		}		public function blueBlock(evt:Event):void{			currentPiece.blue();		}		public function redBlock(evt:Event):void{			currentPiece.red();		}	}}