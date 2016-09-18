package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.List;
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import com.mz.core.event.ChangeValueEvent;
   import morn.core.components.Box;
   import flash.display.DisplayObject;
   import flash.display.BitmapData;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import morn.core.components.Component;
   import flash.display.DisplayObjectContainer;
   
   public class ListSelectSlideEffectS2 implements IDispose
   {
       
      
      public var list:List;
      
      private var sliderBox:Sprite;
      
      private var sliderBm:Bitmap;
      
      public function ListSelectSlideEffectS2(param1:List)
      {
         sliderBox = new Sprite();
         super();
         this.list = param1;
         var _loc2_:Boolean = false;
         sliderBox.mouseEnabled = _loc2_;
         sliderBox.mouseChildren = _loc2_;
         sliderBm = new Bitmap();
         sliderBox.addChild(new Bitmap());
         param1.addEventListener("changeValue",onChangeValue);
      }
      
      private function onChangeValue(param1:ChangeValueEvent) : void
      {
         if(param1.oldValue == param1.newValue)
         {
            return;
         }
         this.drawSlider(list.getCell(param1.newValue));
         list.addChild(sliderBox);
         this.playAnim(param1.newValue,param1.oldValue);
      }
      
      private function drawSlider(param1:Box) : void
      {
         var _loc2_:DisplayObject = distillSelectBox(param1);
         var _loc4_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc4_.draw(_loc2_);
         sliderBm.bitmapData = _loc4_;
         var _loc3_:Point = DisplayUtils.localToTarget(_loc2_,this.list);
         sliderBox.x = _loc3_.x;
         sliderBox.y = _loc3_.y;
      }
      
      private function playAnim(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
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
            _loc3_ = distillSelectBox(_loc4_);
            _loc5_ = DisplayUtils.localToTarget(_loc3_,this.list);
         }
         distillSelectBox(list.getCell(param1)).setVisibleList("LIST_SLIDER_SELECT_BOX",false);
         TweenLite.from(this.sliderBox,0.4,{
            "x":_loc5_.x,
            "y":_loc5_.y,
            "ease":Back.easeOut,
            "onComplete":anim_cpl,
            "onCompleteParams":[param1]
         });
      }
      
      private function distillSelectBox(param1:DisplayObjectContainer) : Component
      {
         var _loc2_:* = null;
         _loc2_ = param1.getChildByName("selectBox" + 1);
         if(_loc2_ == null)
         {
            _loc2_ = param1.getChildByName("selectBox");
         }
         return _loc2_ as Component;
      }
      
      private function anim_cpl(param1:int) : void
      {
         distillSelectBox(list.getCell(param1)).setVisibleList("LIST_SLIDER_SELECT_BOX",true);
         DisplayUtils.removeSelf(sliderBox);
      }
      
      public function dispose() : void
      {
         this.list = null;
      }
   }
}
