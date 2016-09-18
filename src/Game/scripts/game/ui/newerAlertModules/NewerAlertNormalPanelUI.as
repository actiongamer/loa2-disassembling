package game.ui.newerAlertModules
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.CheckBox;
   
   public class NewerAlertNormalPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="311" height="229">
			  <Image skin="png.uiNewerAlert.img_smallBg" x="33" y="131"/>
			  <Label text="普通说明" autoSize="none" x="5" y="134" style="普通说明" width="300" height="20" align="center" var="txt_desc"/>
			  <Image skin="png.a5.comps.img_block" x="161" y="85" anchorX="0.5" anchorY="0.5" var="img_icon"/>
			  <CheckBox label="\l11700030" x="99" y="157" selected="false" style="CheckBox普通" var="checkBox_alert" language="en" lgx="79,99" lgy="157,157"/>
			  <Label text="装备" autoSize="none" x="30" y="102" style="渐变1" width="260" height="27" align="center" var="txt_func" font="Microsoft YaHei" size="20"/>
			</FadeView>;
       
      
      public var txt_desc:Label = null;
      
      public var img_icon:Image = null;
      
      public var checkBox_alert:CheckBox = null;
      
      public var txt_func:Label = null;
      
      public function NewerAlertNormalPanelUI()
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
