package com.riaidea.text
{
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.text.TextLineMetrics;
   import flash.utils.getQualifiedClassName;
   
   class SpriteRenderer
   {
       
      
      private var _rtf:com.riaidea.text.RichTextField;
      
      private var _numSprites:int;
      
      private var _spriteContainer:Sprite;
      
      private var _spriteIndices:Dictionary;
      
      function SpriteRenderer(param1:com.riaidea.text.RichTextField)
      {
         super();
         _rtf = param1;
         _numSprites = 0;
         _spriteContainer = new Sprite();
         _spriteIndices = new Dictionary();
      }
      
      function render() : void
      {
         if(_numSprites > 0)
         {
            _spriteContainer.addEventListener("enterFrame",onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         _spriteContainer.removeEventListener("enterFrame",onEnterFrame);
         doRender();
      }
      
      private function doRender() : void
      {
         _spriteContainer.y = 0;
         renderVisibleSprites();
      }
      
      private function renderVisibleSprites() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = textRenderer.scrollV - 1;
         var _loc3_:int = textRenderer.bottomScrollV - 1;
         var _loc2_:int = textRenderer.getLineOffset(_loc1_);
         var _loc5_:int = textRenderer.getLineOffset(_loc3_) + textRenderer.getLineLength(_loc3_) - 1;
         while(_spriteContainer.numChildren > 0)
         {
            _spriteContainer.removeChildAt(0);
         }
         while(_loc2_ <= _loc5_)
         {
            if(_rtf.isSpriteAt(_loc2_))
            {
               _loc4_ = getSprite(_loc2_);
               if(_loc4_ != null)
               {
                  renderSprite(_loc4_,_loc2_);
               }
            }
            _loc2_++;
         }
      }
      
      private function renderSprite(param1:DisplayObject, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc3_:* = null;
         var _loc4_:Rectangle = textRenderer.getCharBoundaries(param2);
         if(_loc4_ != null)
         {
            param1.x = _loc4_.x + (_loc4_.width - param1.width) * 0.5 + 0.5 >> 0;
            _loc5_ = (_loc4_.height - param1.height) * 0.5;
            _loc3_ = textRenderer.getLineMetrics(textRenderer.getLineIndexOfChar(param2));
            if(_loc5_ + param1.height < _loc3_.ascent)
            {
               _loc5_ = _loc3_.ascent - param1.height;
            }
            param1.y = _loc4_.y + _loc5_ + 0.5 >> 0;
            _spriteContainer.addChild(param1);
         }
      }
      
      function adjustSpritesIndex(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc5_:Boolean = false;
         var _loc7_:int = 0;
         var _loc6_:* = _spriteIndices;
         for(var _loc4_ in _spriteIndices)
         {
            _loc3_ = _loc4_.name;
            if(_loc3_ > param1 - param2)
            {
               _loc4_.name = _loc3_ + param2;
               _loc5_ = true;
            }
         }
         return _loc5_;
      }
      
      function insertSprite(param1:DisplayObject, param2:int) : void
      {
         if(_spriteIndices[param1] == null)
         {
            param1.name = String(param2);
            _spriteIndices[param1] = true;
            _numSprites = Number(_numSprites) + 1;
         }
      }
      
      function removeSprite(param1:int) : void
      {
         var _loc2_:DisplayObject = getSprite(param1);
         if(_loc2_ != null)
         {
            if(_spriteContainer.contains(_loc2_))
            {
               _spriteContainer.removeChild(_loc2_);
            }
            delete _spriteIndices[_loc2_];
            _numSprites = Number(_numSprites) - 1;
         }
      }
      
      function getSprite(param1:int) : DisplayObject
      {
         var _loc4_:int = 0;
         var _loc3_:* = _spriteIndices;
         for(var _loc2_ in _spriteIndices)
         {
            if(param1 == int(_loc2_.name))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      function getSpriteIndex(param1:DisplayObject) : int
      {
         if(_spriteIndices[param1] == true)
         {
            return int(param1.name);
         }
         return -1;
      }
      
      function clear() : void
      {
         while(_spriteContainer.numChildren > 0)
         {
            _spriteContainer.removeChildAt(0);
         }
         var _loc3_:int = 0;
         var _loc2_:* = _spriteIndices;
         for(var _loc1_ in _spriteIndices)
         {
            delete _spriteIndices[_loc1_];
         }
         _numSprites = 0;
      }
      
      private function get textRenderer() : TextRenderer
      {
         return _rtf.textfield as TextRenderer;
      }
      
      function get container() : Sprite
      {
         return _spriteContainer;
      }
      
      function get numSprites() : int
      {
         return _numSprites;
      }
      
      function exportXML() : XML
      {
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:Array = [];
         var _loc8_:int = 0;
         var _loc7_:* = _spriteIndices;
         for(var _loc2_ in _spriteIndices)
         {
            _loc6_ = {
               "src":getQualifiedClassName(_loc2_),
               "index":_loc2_.name
            };
            _loc3_.push(_loc6_);
         }
         if(_loc3_.length > 1)
         {
            _loc3_.sortOn("index",16);
         }
         var _loc4_:XML = <sprites/>;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc1_ = <sprite src="{_loc3_[_loc5_].src}" index="{_loc3_[_loc5_].index - _loc5_}" />;
            _loc4_.appendChild(_loc1_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      function getSpriteArry() : Array
      {
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = _spriteIndices;
         for(var _loc1_ in _spriteIndices)
         {
            _loc3_ = {
               "src":getQualifiedClassName(_loc1_),
               "index":_loc1_.name
            };
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
   }
}
