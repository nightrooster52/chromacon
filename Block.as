﻿package  {		import flash.display.Sprite;		public class Block extends Sprite{		public var type:String = "basic";		public var sprite:Sprite = new BasicBlock();		public var boardX:int = 0;		public var boardY:int = 0;				public function Block() {			// constructor code			addChild(sprite);			reSkin();					}				public function reSkin(){			removeChild(sprite);			if(type == "red"){				sprite = new RedBlock();			}else if(type == "blue"){				sprite = new BlueBlock();			}else if(type == "yellow"){				sprite = new YellowBlock();			}else if(type == "green"){				sprite = new GreenBlock();			}else if(type == "purple"){				sprite = new PurpleBlock();			}else if(type == "orange"){				sprite = new OrangeBlock();			}else if(type == "white"){				sprite = new WhiteBlock();			}else{				sprite = new BasicBlock();			}			addChild(sprite);					}	}	}