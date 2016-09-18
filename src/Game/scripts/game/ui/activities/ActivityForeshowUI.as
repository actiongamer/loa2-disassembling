package game.ui.activities
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ActivityForeshowUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="650" height="495">
			  <PanelBg x="0" y="0" width="650" height="495" showTabLine="false"/>
			  <Box x="3" y="23" var="imgBox">
			    <Image skin="png.uiActivityForeshow.imgRMask" x="612" var="imgR" y="0" width="32" height="473"/>
			    <Image skin="png.uiActivityForeshow.imgLMask" var="imgL" height="473"/>
			  </Box>
			  <Image skin="png.uiActivityForeshow.imgDescBack" x="0" y="419" width="648" height="75"/>
			  <Label autoSize="center" x="78.5" y="430" width="493" height="57" var="txtDesc" rotation="0" mouseEnabled="false" mouseChildren="false" text="ABCD" align="center" style="普通绿色" bold="false" multiline="true" wordWrap="true" size="16"/>
			  <Button skin="png.a5.btns.btn_longBar" x="616" y="200" var="btnRight"/>
			  <Button skin="png.a5.btns.btn_longBar" x="35" y="200" var="btnLeft" scaleX="-1"/>
			  <Image skin="png.uiActivityForeshow.imgRBBack" x="51.5" y="399" width="547" height="24" var="rbBack"/>
			</PopModuleView>;
       
      
      public var imgBox:Box = null;
      
      public var imgR:Image = null;
      
      public var imgL:Image = null;
      
      public var txtDesc:Label = null;
      
      public var btnRight:Button = null;
      
      public var btnLeft:Button = null;
      
      public var rbBack:Image = null;
      
      public function ActivityForeshowUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
