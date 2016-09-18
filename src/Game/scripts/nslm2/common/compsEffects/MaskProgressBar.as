package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   
   public class MaskProgressBar implements IDispose
   {
       
      
      private var _barImg:Image;
      
      public function MaskProgressBar(param1:ProgressBar)
      {
         super();
         _barImg = new Image(param1.bar.skin);
         _barImg.x = param1.bar.x;
         _barImg.y = param1.bar.y;
         param1.bar.parent.addChild(_barImg);
         _barImg.mask = param1.bar;
      }
      
      public function dispose() : void
      {
         _barImg.dispose();
         _barImg = null;
      }
   }
}
