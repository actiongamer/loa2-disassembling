package nslm2.modules.cultivates.equipGrows.jinglians
{
   import com.mz.core.interFace.IDispose;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import morn.core.components.ProgressBar;
   import morn.core.components.Image;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.utils.DisplayUtils;
   
   public class ProgressBarPreFlickerEffCtrl implements IDispose
   {
       
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var progressBar:ProgressBar;
      
      private var preBar:Image;
      
      private var _preValue:Number;
      
      public function ProgressBarPreFlickerEffCtrl(param1:ProgressBar)
      {
         super();
         this.progressBar = param1;
         preBar = new Image();
         preBar.filters = [FilterUtil.highLightFilter(30)];
         preBar.skin = this.progressBar.bar.skin;
         preBar.autoSize = this.progressBar.bar.autoSize;
         preBar.sizeGrid = this.progressBar.bar.sizeGrid;
         DisplayUtils.addChildBelow(preBar,this.progressBar.bar);
         flickerTxtExpPre = new FlickerEffCtrl(preBar);
         flickerTxtExpPre.pause();
         this.preValue = 0;
      }
      
      public function get preValue() : Number
      {
         return _preValue;
      }
      
      public function set preValue(param1:Number) : void
      {
         if(_preValue != param1)
         {
            _preValue = param1;
            MornExpandUtil.countProgressBarWidth(this.progressBar,param1,this.preBar);
            if(_preValue > 0)
            {
               flickerTxtExpPre.resume();
            }
            else
            {
               flickerTxtExpPre.pause();
            }
         }
      }
      
      public function dispose() : void
      {
         if(flickerTxtExpPre)
         {
            flickerTxtExpPre.dispose();
            flickerTxtExpPre = null;
         }
         progressBar = null;
         if(preBar)
         {
            this.preBar.dispose();
            this.preBar = null;
         }
      }
   }
}
