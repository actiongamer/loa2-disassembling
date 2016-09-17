package game.ui.newerAlertModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   
   public class NewerAlertFightValuePanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="311" height="229">
			  <Label text="\l999001123" autoSize="none" x="25.5" y="47" style="渐变1" width="260" height="27" align="center" var="txt_func" font="Microsoft YaHei" size="20"/>
			  <Label text="普通说明" autoSize="none" x="34.5" y="81" style="普通说明" width="242" height="86" align="center" var="txt_desc" multiline="true" wordWrap="true"/>
			</FadeView>;
       
      
      public var txt_func:Label = null;
      
      public var txt_desc:Label = null;
      
      public function NewerAlertFightValuePanelUI()
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
