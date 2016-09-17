package morn.customs.components
{
   import morn.core.components.Tab;
   import flash.events.Event;
   import morn.core.components.Button;
   import flash.display.Sprite;
   
   public class TabMed
   {
       
      
      public var maxLineItemCount:int = 7;
      
      public var space:int = 0;
      
      public var maxWidth:int = 760;
      
      public var lineOffset:int = 5;
      
      public var btnHeight:int = 23;
      
      public var lineHeight:int = 20;
      
      public var btnLabelTop:int = 3;
      
      private var tab:Tab;
      
      public function TabMed(param1:Tab)
      {
         super();
         this.tab = param1;
         this.space = param1.space;
         param1.addEventListener("select",tabSelectHandler);
      }
      
      public function updateBtnsPosition() : void
      {
         if(tab.selectedIndex == -1 || tab.selectedIndex >= tab.items.length)
         {
            doUpdateBtns(0);
         }
         else
         {
            doUpdateBtns(tab.selectedIndex);
         }
      }
      
      private function tabSelectHandler(param1:Event) : void
      {
         updateBtnsPosition();
      }
      
      private function doUpdateBtns(param1:int) : void
      {
         var _loc10_:* = 0;
         var _loc3_:* = null;
         if(tab.items.length <= maxLineItemCount)
         {
            return;
         }
         tab.commitMeasure();
         var _loc7_:int = tab.items.length / 2;
         var _loc5_:int = tab.items.length - _loc7_;
         if(_loc7_ == _loc5_)
         {
            _loc7_++;
            _loc5_--;
         }
         var _loc4_:* = param1 < _loc7_;
         var _loc6_:int = !!_loc4_?0:lineOffset;
         var _loc9_:int = !!_loc4_?lineOffset:0;
         var _loc2_:int = (maxWidth - _loc6_ * 2 + space) / _loc7_ - space;
         var _loc8_:int = (maxWidth - _loc9_ * 2 + space) / _loc5_ - space;
         _loc10_ = 0;
         while(_loc10_ < tab.items.length)
         {
            _loc3_ = tab.items[_loc10_] as Button;
            if(_loc10_ < _loc7_)
            {
               _loc3_.x = _loc10_ * (_loc2_ + space) + _loc6_;
               _loc3_.width = _loc2_;
            }
            else
            {
               _loc3_.x = (_loc10_ - _loc7_) * (_loc8_ + space) + _loc9_;
               _loc3_.width = _loc8_;
            }
            if(_loc4_ == _loc10_ < _loc7_)
            {
               _loc3_.y = 0;
               _loc3_.height = btnHeight;
               removeHitArea(_loc3_);
            }
            else
            {
               _loc3_.y = -lineHeight;
               _loc3_.height = btnHeight + lineHeight;
               addHitArea(_loc3_);
            }
            _loc3_.commitMeasure();
            _loc3_.btnLabel.centerY = NaN;
            _loc3_.btnLabel.top = btnLabelTop;
            _loc10_++;
         }
         if(_loc4_)
         {
            _loc10_ = _loc7_;
            while(_loc10_ < tab.items.length)
            {
               _loc3_ = tab.items[_loc10_] as Button;
               tab.addChild(_loc3_);
               _loc10_++;
            }
            _loc10_ = 0;
            while(_loc10_ < _loc7_)
            {
               _loc3_ = tab.items[_loc10_] as Button;
               tab.addChild(_loc3_);
               _loc10_++;
            }
         }
         else
         {
            _loc10_ = 0;
            while(_loc10_ < tab.items.length)
            {
               _loc3_ = tab.items[_loc10_] as Button;
               tab.addChild(_loc3_);
               _loc10_++;
            }
         }
      }
      
      private function addHitArea(param1:Button) : void
      {
         var _loc2_:* = null;
         if(param1.getChildByName("mHitArea") == null)
         {
            _loc2_ = new Sprite();
            _loc2_.name = "mHitArea";
            _loc2_.graphics.beginFill(0,0);
            _loc2_.graphics.drawRect(0,0,param1.width,btnHeight);
            _loc2_.graphics.endFill();
            param1.addChild(_loc2_);
            param1.hitArea = _loc2_;
         }
      }
      
      private function removeHitArea(param1:Button) : void
      {
         param1.removeChildByName("mHitArea");
         param1.hitArea = null;
      }
   }
}
