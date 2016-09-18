package nslm2.modules.cultivates.equipGrows.jinglians
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Component;
   import com.greensock.TweenLite;
   import com.mz.core.utils.FilterUtil;
   
   public class ComponentFlickerEff implements IDispose
   {
       
      
      private var _comp:Component;
      
      private var _compHighlight:Number = 0;
      
      public function ComponentFlickerEff(param1:Component)
      {
         super();
         _comp = param1;
      }
      
      public function showLight() : void
      {
         TweenLite.to(this,0.4,{
            "compHighlight":50,
            "onComplete":showDark
         });
      }
      
      public function showDark() : void
      {
         TweenLite.to(this,0.4,{"compHighlight":0});
      }
      
      public function set compHighlight(param1:Number) : void
      {
         _compHighlight = param1;
         _comp.filters = [FilterUtil.highLightFilter(_compHighlight)];
      }
      
      public function get compHighlight() : Number
      {
         return _compHighlight;
      }
      
      public function dispose() : void
      {
         _comp = null;
      }
   }
}
