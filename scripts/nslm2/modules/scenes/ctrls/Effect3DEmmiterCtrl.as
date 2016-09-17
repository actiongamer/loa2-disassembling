package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.SpecterEmmiter;
   import com.greensock.TweenLite;
   
   public class Effect3DEmmiterCtrl implements IDispose
   {
       
      
      public var eff:SpecterEffect;
      
      public var emmiterArr:Array;
      
      public function Effect3DEmmiterCtrl(param1:SpecterEffect, param2:Array)
      {
         super();
         this.eff = param1;
         this.emmiterArr = param2;
      }
      
      public function hideAll(param1:Number = 0) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = emmiterArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = eff.getEmmiterByName(emmiterArr[_loc4_]);
            if(_loc2_)
            {
               if(param1)
               {
                  _loc2_.alpha = 1;
                  TweenLite.to(_loc2_,param1,{
                     "alpha":0,
                     "overwrite":1,
                     "onUpdate":tweenAlphaChange,
                     "onUpdateParams":[_loc2_],
                     "onComplete":hideAllComplete,
                     "onCompleteParams":[_loc2_]
                  });
               }
               else
               {
                  TweenLite.killTweensOf(_loc2_);
                  _loc2_.alpha = 0;
                  _loc2_.visible = false;
               }
            }
            _loc4_++;
         }
      }
      
      public function showAll(param1:Number = 0) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = emmiterArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = eff.getEmmiterByName(emmiterArr[_loc4_]);
            if(_loc2_)
            {
               _loc2_.visible = true;
               if(param1)
               {
                  _loc2_.alpha = 0;
                  TweenLite.to(_loc2_,param1,{
                     "alpha":1,
                     "overwrite":1,
                     "onUpdate":tweenAlphaChange,
                     "onUpdateParams":[_loc2_]
                  });
               }
               else
               {
                  TweenLite.killTweensOf(_loc2_);
                  _loc2_.alpha = 1;
               }
            }
            _loc4_++;
         }
      }
      
      private function hideAllComplete(param1:SpecterEmmiter) : void
      {
         param1.visible = false;
      }
      
      private function tweenAlphaChange(param1:SpecterEmmiter) : void
      {
         param1.update(0,0);
      }
      
      public function dispose() : void
      {
         emmiterArr = null;
         eff = null;
      }
   }
}
