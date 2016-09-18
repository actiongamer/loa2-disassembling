package morn.core.components
{
   public class LinkButton extends Button
   {
       
      
      public function LinkButton(param1:String = "")
      {
         super(null,param1);
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
         _labelColors = Styles.linkLabelColors;
         _autoSize = false;
         buttonMode = true;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         _btnLabel.underline = true;
         _btnLabel.autoSize = "left";
      }
      
      override protected function changeLabelSize() : void
      {
      }
   }
}
