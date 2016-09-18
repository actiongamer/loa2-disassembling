package morn.customs.components
{
   import morn.core.components.Component;
   import morn.core.components.List;
   
   public class PlaceholderList extends Placeholder
   {
       
      
      protected var _renderWidth:int = 50;
      
      protected var _renderHeight:int = 50;
      
      protected var _repeatX:int = 2;
      
      protected var _repeatY:int = 2;
      
      protected var _spaceX:int = 10;
      
      protected var _spaceY:int = 10;
      
      private var _hScrollBarSkin:String;
      
      private var _vScrollBarSkin:String;
      
      public function PlaceholderList()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.callLater(draw);
      }
      
      override protected function draw() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
      }
      
      public function get renderWidth() : int
      {
         return _renderWidth;
      }
      
      public function set renderWidth(param1:int) : void
      {
         _renderWidth = param1;
         callLater(draw);
      }
      
      public function get renderHeight() : int
      {
         return _renderHeight;
      }
      
      public function set renderHeight(param1:int) : void
      {
         _renderHeight = param1;
         callLater(draw);
      }
      
      public function get repeatX() : int
      {
         return _repeatX;
      }
      
      public function set repeatX(param1:int) : void
      {
         _repeatX = param1;
         callLater(draw);
      }
      
      public function get repeatY() : int
      {
         return _repeatY;
      }
      
      public function set repeatY(param1:int) : void
      {
         _repeatY = param1;
         callLater(draw);
      }
      
      public function get spaceX() : int
      {
         return _spaceX;
      }
      
      public function set spaceX(param1:int) : void
      {
         _spaceX = param1;
         callLater(draw);
      }
      
      public function get spaceY() : int
      {
         return _spaceY;
      }
      
      public function set spaceY(param1:int) : void
      {
         _spaceY = param1;
         callLater(draw);
      }
      
      public function get hScrollBarSkin() : String
      {
         return _hScrollBarSkin;
      }
      
      public function set hScrollBarSkin(param1:String) : void
      {
         _hScrollBarSkin = param1;
      }
      
      public function get vScrollBarSkin() : String
      {
         return _vScrollBarSkin;
      }
      
      public function set vScrollBarSkin(param1:String) : void
      {
         _vScrollBarSkin = param1;
      }
      
      override public function replaceWith(param1:Component) : Component
      {
         if(param1 is List)
         {
            if(this.vScrollBarSkin)
            {
               (param1 as List).vScrollBarSkin = this.vScrollBarSkin;
            }
            if(this.hScrollBarSkin)
            {
               (param1 as List).hScrollBarSkin = this.hScrollBarSkin;
            }
            (param1 as List).repeatX = this.repeatX;
            (param1 as List).repeatY = this.repeatY;
            (param1 as List).spaceX = this.spaceX;
            (param1 as List).spaceY = this.spaceY;
         }
         return super.replaceWith(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.graphics.clear();
      }
   }
}
