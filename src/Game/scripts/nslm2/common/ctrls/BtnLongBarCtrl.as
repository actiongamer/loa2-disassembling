package nslm2.common.ctrls
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.mediators.RollMediator;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   
   public class BtnLongBarCtrl implements IDispose
   {
       
      
      private var _rollMediator:RollMediator;
      
      private var _btn:Button;
      
      private var _bg:Image;
      
      public function BtnLongBarCtrl(param1:Button, param2:Image)
      {
         super();
         _bg = param2;
         _btn = param1;
         DisplayUtils.addChildFromGlobal(param1,param2);
         param1.setChildIndex(param2,0);
         param2.alpha = 0;
         _rollMediator = new RollMediator(param1,onRoll);
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this._bg,0.3,{"alpha":1});
         }
         else
         {
            TweenLite.to(this._bg,0.3,{"alpha":0});
         }
      }
      
      public function dispose() : void
      {
         _rollMediator.dispose();
      }
   }
}
