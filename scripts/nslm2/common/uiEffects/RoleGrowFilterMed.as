package nslm2.common.uiEffects
{
   import com.mz.core.mediators.RollMediator;
   import flash.filters.GlowFilter;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import flash.display.DisplayObject;
   
   public class RoleGrowFilterMed extends RollMediator
   {
       
      
      private var _glowFilter:GlowFilter;
      
      private var _glow:Number = 0;
      
      public function RoleGrowFilterMed(param1:DisplayObject, param2:GlowFilter)
      {
         this.glowFilter = param2;
         super(param1,this.rollHandler);
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
      
      private function rollHandler(param1:Boolean) : void
      {
         if(glowFilter == null)
         {
            return;
         }
         if(param1)
         {
            TweenLite.to(this,0.4,{
               "glow":glowFilter.blurX,
               "ease":Cubic.easeOut
            });
         }
         else
         {
            TweenLite.to(this,0.2,{
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
      
      public function showGlow() : void
      {
         if(glowFilter == null)
         {
            return;
         }
         this.actived = false;
         this.glow = glowFilter.blurX;
      }
      
      public function hideGlow() : void
      {
         if(glowFilter == null)
         {
            return;
         }
         this.actived = true;
         this.glow = 0;
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(this);
         super.dispose();
      }
   }
}
