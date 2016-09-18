package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.List;
   import com.mz.core.display.MzSprite;
   import flash.utils.Dictionary;
   import flash.display.Bitmap;
   import com.mz.core.event.ChangeValueEvent;
   import morn.core.components.Box;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   
   public class ListSelectSlideEffect implements IDispose
   {
      
      public static const renderBg:String = "renderBg";
       
      
      public var list:List;
      
      public var fakeBox:MzSprite;
      
      private var hideLib:Dictionary;
      
      private var slider:Bitmap;
      
      private var isAniming:Boolean = false;
      
      public function ListSelectSlideEffect(param1:List)
      {
         super();
         this.list = param1;
         param1.addEventListener("changeValue",onChangeValue);
      }
      
      private function onChangeValue(param1:ChangeValueEvent) : void
      {
         if(isAniming)
         {
            return;
         }
         if(param1.oldValue == param1.newValue)
         {
            return;
         }
         this.fakeBox = new MzSprite();
         hideLib = new Dictionary();
         drawBack();
         this.recover();
         this.drawSlider(list.getCell(param1.newValue));
         drawFront();
         this.recover();
         list.addChild(fakeBox);
         list.content.visible = false;
         this.playAnim(param1.newValue,param1.oldValue);
      }
      
      private function drawBack() : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc1_:Vector.<Box> = this.list.cells;
         var _loc4_:int = _loc1_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc1_[_loc6_];
            hideOther(_loc5_);
            _loc6_++;
         }
         var _loc2_:BitmapData = new BitmapData(list.width,list.height,true,0);
         _loc2_.draw(list);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         _loc3_.x = 0;
         _loc3_.y = 0;
         fakeBox.addChild(_loc3_);
      }
      
      private function hideOther(param1:DisplayObjectContainer) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.numChildren;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = param1.getChildAt(_loc4_);
            if(_loc2_.name != "renderBg")
            {
               changeToHide(_loc2_);
            }
            _loc4_--;
         }
      }
      
      private function changeToHide(param1:DisplayObject) : void
      {
         if(param1 && param1.visible == true)
         {
            param1.visible = false;
            this.hideLib[param1] = 1;
         }
      }
      
      private function drawFront() : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc1_:* = null;
         var _loc2_:Vector.<Box> = this.list.cells;
         var _loc5_:int = _loc2_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc7_];
            _loc1_ = _loc6_.getChildByName("selectBox");
            if(_loc1_)
            {
               changeToHide(_loc1_);
            }
            _loc1_ = _loc6_.getChildByName("selectBox" + 0);
            if(_loc1_)
            {
               changeToHide(_loc1_);
            }
            _loc1_ = _loc6_.getChildByName("selectBox" + 1);
            if(_loc1_)
            {
               changeToHide(_loc1_);
            }
            changeToHide(_loc6_.getChildByName("renderBg"));
            _loc7_++;
         }
         var _loc3_:BitmapData = new BitmapData(list.width,list.height,true,0);
         _loc3_.draw(list);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         _loc4_.x = 0;
         _loc4_.y = 0;
         fakeBox.addChild(_loc4_);
      }
      
      private function drawSlider(param1:Box) : void
      {
         var _loc2_:* = null;
         _loc2_ = param1.getChildByName("selectBox");
         if(_loc2_ == null)
         {
            _loc2_ = param1.getChildByName("selectBox" + 1);
         }
         var _loc4_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc4_.draw(_loc2_);
         var _loc5_:Bitmap = new Bitmap(_loc4_);
         slider = _loc5_;
         var _loc3_:Point = DisplayUtils.localToTarget(_loc2_,this.list);
         _loc5_.x = _loc3_.x;
         _loc5_.y = _loc3_.y;
         fakeBox.addChild(_loc5_);
      }
      
      private function recover() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Vector.<Box> = this.list.cells;
         var _loc2_:int = _loc1_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _loc1_[_loc4_];
            recoverAll(_loc3_);
            _loc4_++;
         }
      }
      
      private function recoverAll(param1:DisplayObjectContainer) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.numChildren;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc2_ = param1.getChildAt(_loc4_);
            if(hideLib[_loc2_])
            {
               _loc2_.visible = true;
            }
            _loc4_--;
         }
      }
      
      private function playAnim(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         isAniming = true;
         var _loc4_:Box = list.getCell(param2);
         var _loc5_:Point = new Point();
         if(_loc4_ == null)
         {
            if(param2 < param1)
            {
               _loc5_ = new Point(_loc5_.x,0);
            }
            else
            {
               _loc5_ = new Point(_loc5_.x,list.height);
            }
         }
         else
         {
            _loc3_ = _loc4_.getChildByName("selectBox");
            if(_loc3_ == null)
            {
               _loc3_ = _loc4_.getChildByName("selectBox" + 1);
            }
            _loc5_ = DisplayUtils.localToTarget(_loc3_,this.list);
         }
         TweenLite.from(this.slider,0.4,{
            "x":_loc5_.x,
            "y":_loc5_.y,
            "ease":Back.easeOut,
            "onComplete":anim_cpl
         });
      }
      
      private function anim_cpl() : void
      {
         isAniming = false;
         this.slider = null;
         this.fakeBox.dispose();
         fakeBox = null;
         hideLib = null;
         this.list.content.visible = true;
      }
      
      public function dispose() : void
      {
         this.list = null;
      }
   }
}
