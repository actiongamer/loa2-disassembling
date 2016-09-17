package nslm2.common.uiEffects
{
   import com.mz.core.interFace.IDispose;
   import flash.filters.GlowFilter;
   import flash.display.DisplayObject;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   
   public class UITweenGlowFilterMed implements IDispose
   {
       
      
      private var _glowFilter:GlowFilter;
      
      public var ui:DisplayObject;
      
      private var _glow:Number = 0;
      
      public var isDispose:Boolean = false;
      
      public function UITweenGlowFilterMed(param1:DisplayObject, param2:GlowFilter)
      {
         super();
         this.glowFilter = param2;
         this.ui = param1;
         if(param1 == null)
         {
            throw new Error(param1 + "can be null");
         }
      }
      
      public function get glowFilter() : GlowFilter
      {
         return _glowFilter;
      }
      
      public function set glowFilter(param1:GlowFilter) : void
      {
         if(param1)
         {
            _glowFilter = param1.clone() as GlowFilter;
         }
         else
         {
            _glowFilter = null;
         }
      }
      
      public function switchFilter(param1:Boolean, param2:Number = NaN) : void
      {
         if(param1)
         {
            if(isNaN(param2))
            {
               param2 = 0.4;
            }
            TweenLite.to(this,param2,{
               "glow":glowFilter.blurX,
               "ease":Cubic.easeOut
            });
         }
         else
         {
            if(isNaN(param2))
            {
               param2 = 0.2;
            }
            TweenLite.to(this,param2,{
               "glow":0,
               "ease":Cubic.easeOut
            });
         }
      }
      
      public function get glow() : Number
      {
         return _glow;
      }
      
      public function set glow(param1:Number) : void
      {
         var _loc2_:* = null;
         _glow = param1;
         if(this.isDispose)
         {
            return;
         }
         if(ui == null)
         {
            return;
         }
         if(glowFilter)
         {
            if(_glow == 0)
            {
               ui.filters = [];
            }
            else
            {
               _loc2_ = glowFilter.clone() as GlowFilter;
               var _loc3_:* = _glow;
               _loc2_.blurY = _loc3_;
               _loc2_.blurX = _loc3_;
               ui.filters = [_loc2_];
            }
         }
         else
         {
            ui.filters = [];
         }
      }
      
      public function dispose() : void
      {
         this.isDispose = true;
         TweenLite.killTweensOf(this);
      }
   }
}
