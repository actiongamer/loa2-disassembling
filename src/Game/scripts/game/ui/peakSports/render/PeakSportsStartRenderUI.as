package game.ui.peakSports.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PeakSportsStartRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="382" height="250">
			  <Label text="姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名姓名&#xD;&#xD;姓名&#xD;" autoSize="none" x="33" y="72" style="普通说明" width="319" align="center" var="txt_alert" height="71" size="15" wordWrap="true" multiline="false"/>
			  <Label text="姓名" autoSize="none" x="34" y="149" style="不足禁止红" width="319" align="center" var="txt_timer"/>
			</View>;
       
      
      public var txt_alert:Label = null;
      
      public var txt_timer:Label = null;
      
      public function PeakSportsStartRenderUI()
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
