package morn.core.components
{
   import morn.editor.core.IRender;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Tree extends Box implements IRender
   {
       
      
      protected var _list:morn.core.components.List;
      
      protected var _source:Array;
      
      protected var _xml:XML;
      
      protected var _renderHandler:Handler;
      
      protected var _spaceLeft:Number = 10;
      
      protected var _spaceBottom:Number = 0;
      
      protected var _keepOpenStatus:Boolean = true;
      
      public function Tree()
      {
         super();
         height = 200;
         width = 200;
      }
      
      override protected function createChildren() : void
      {
         _list = new morn.core.components.List();
         addChild(new morn.core.components.List());
         _list.renderHandler = new Handler(renderItem);
         _list.addEventListener("change",onListChange);
      }
      
      private function onListChange(param1:Event) : void
      {
         sendEvent("change");
      }
      
      public function get keepOpenStatus() : Boolean
      {
         return _keepOpenStatus;
      }
      
      public function set keepOpenStatus(param1:Boolean) : void
      {
         _keepOpenStatus = param1;
      }
      
      public function get array() : Array
      {
         return _list.array;
      }
      
      public function set array(param1:Array) : void
      {
         if(_keepOpenStatus && _list.array && param1)
         {
            parseOpenStatus(_list.array,param1);
         }
         _source = param1;
         _list.array = getArray();
      }
      
      public function get source() : Array
      {
         return _source;
      }
      
      public function get list() : morn.core.components.List
      {
         return _list;
      }
      
      public function get itemRender() : *
      {
         return _list.itemRender;
      }
      
      public function set itemRender(param1:*) : void
      {
         _list.itemRender = param1;
      }
      
      public function get scrollBarSkin() : String
      {
         return _list.vScrollBarSkin;
      }
      
      public function set scrollBarSkin(param1:String) : void
      {
         _list.vScrollBarSkin = param1;
      }
      
      public function get mouseHandler() : *
      {
         return _list.mouseHandler;
      }
      
      public function set mouseHandler(param1:*) : void
      {
         _list.mouseHandler = param1;
      }
      
      public function get renderHandler() : Handler
      {
         return _renderHandler;
      }
      
      public function set renderHandler(param1:Handler) : void
      {
         _renderHandler = param1;
      }
      
      public function get spaceLeft() : Number
      {
         return _spaceLeft;
      }
      
      public function set spaceLeft(param1:Number) : void
      {
         _spaceLeft = param1;
      }
      
      public function get spaceBottom() : Number
      {
         return _list.spaceY;
      }
      
      public function set spaceBottom(param1:Number) : void
      {
         _list.spaceY = param1;
      }
      
      public function get selectedIndex() : int
      {
         return _list.selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         _list.selectedIndex = param1;
      }
      
      public function get selectedItem() : Object
      {
         return _list.selectedItem;
      }
      
      public function set selectedItem(param1:Object) : void
      {
         _list.selectedItem = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _list.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _list.height = param1;
      }
      
      protected function getArray() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _source;
         for each(var _loc2_ in _source)
         {
            if(getParentOpenStatus(_loc2_))
            {
               _loc2_.x = _spaceLeft * getDepth(_loc2_);
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      protected function getDepth(param1:Object, param2:int = 0) : int
      {
         if(param1.nodeParent == null)
         {
            return param2;
         }
         return getDepth(param1.nodeParent,param2 + 1);
      }
      
      protected function getParentOpenStatus(param1:Object) : Boolean
      {
         var _loc2_:Object = param1.nodeParent;
         if(_loc2_ == null)
         {
            return true;
         }
         if(_loc2_.isOpen)
         {
            if(_loc2_.nodeParent != null)
            {
               return getParentOpenStatus(_loc2_);
            }
            return true;
         }
         return false;
      }
      
      private function renderItem(param1:Box, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:Object = param1.dataSource;
         if(_loc5_)
         {
            param1.left = _loc5_.x;
            _loc4_ = param1.getChildByName("arrow") as Clip;
            if(_loc4_)
            {
               if(_loc5_.hasChild)
               {
                  _loc4_.visible = true;
                  _loc4_.frame = !!_loc5_.isOpen?1:0;
                  _loc4_.tag = param2;
                  _loc4_.addEventListener("click",onArrowClick);
               }
               else
               {
                  _loc4_.visible = false;
               }
            }
            _loc3_ = param1.getChildByName("folder") as Clip;
            if(_loc3_)
            {
               if(_loc3_.clipY == 2)
               {
                  _loc3_.frame = !!_loc5_.isDirectory?0:1;
               }
               else
               {
                  _loc3_.frame = !!_loc5_.isDirectory?!!_loc5_.isOpen?1:0:2;
               }
            }
            if(_renderHandler != null)
            {
               _renderHandler.executeWith([param1,param2]);
            }
         }
      }
      
      private function onArrowClick(param1:MouseEvent) : void
      {
         var _loc3_:Clip = param1.currentTarget as Clip;
         var _loc2_:int = _loc3_.tag;
         _list.array[_loc2_].isOpen = !_list.array[_loc2_].isOpen;
         _list.array = getArray();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is XML)
         {
            xml = param1 as XML;
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get xml() : XML
      {
         return _xml;
      }
      
      public function set xml(param1:XML) : void
      {
         _xml = param1;
         var _loc2_:Array = [];
         parseXml(xml,_loc2_,null,true);
         array = _loc2_;
      }
      
      protected function parseXml(param1:XML, param2:Array, param3:Object, param4:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc11_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = param1.children().length();
         if(!param4)
         {
            _loc10_ = {};
            var _loc13_:int = 0;
            var _loc12_:* = param1.attributes();
            for each(var _loc7_ in param1.attributes())
            {
               _loc9_ = _loc7_.name().toString();
               _loc8_ = _loc7_;
               _loc10_[_loc9_] = _loc8_ == "true"?true:_loc8_ == "false"?false:_loc8_;
            }
            _loc10_.nodeParent = param3;
            if(_loc6_ > 0)
            {
               _loc10_.isDirectory = true;
            }
            _loc10_.hasChild = _loc6_ > 0;
            param2.push(_loc10_);
         }
         _loc11_ = 0;
         while(_loc11_ < _loc6_)
         {
            _loc5_ = param1.children()[_loc11_];
            parseXml(_loc5_,param2,_loc10_,false);
            _loc11_++;
         }
      }
      
      protected function parseOpenStatus(param1:Array, param2:Array) : void
      {
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         _loc8_ = 0;
         _loc5_ = param2.length;
         while(_loc8_ < _loc5_)
         {
            _loc3_ = param2[_loc8_];
            if(_loc3_.isDirectory)
            {
               _loc7_ = 0;
               _loc6_ = param1.length;
               while(_loc7_ < _loc6_)
               {
                  _loc4_ = param1[_loc7_];
                  if(_loc4_.isDirectory && isSameParent(_loc4_,_loc3_) && _loc3_.label == _loc4_.label)
                  {
                     _loc3_.isOpen = _loc4_.isOpen;
                     break;
                  }
                  _loc7_++;
               }
            }
            _loc8_++;
         }
      }
      
      protected function isSameParent(param1:Object, param2:Object) : Boolean
      {
         if(param1.nodeParent == null && param2.nodeParent == null)
         {
            return true;
         }
         if(param1.nodeParent == null || param2.nodeParent == null)
         {
            return false;
         }
         if(param1.nodeParent.label == param2.nodeParent.label)
         {
            return isSameParent(param1.nodeParent,param2.nodeParent);
         }
         return false;
      }
   }
}
