package game.ui.funnyEvents
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FunnyEventRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="22">
			  <Label text="NEW" autoSize="none" x="251" y="3" style="不足禁止红" var="txt_new" height="20" align="left" width="122"/>
			  <Label text="[ 2011-12-13 13:14:14 ]" autoSize="left" x="25" y="3" style="普通说明" width="140" height="18" var="txt_time"/>
			  <Image skin="png.uiFunnyEvents.挑战图标" x="0" y="0"/>
			  <Label text="事件内容" autoSize="left" x="165" y="3" style="普通说明" var="txt_content"/>
			  <Label text="[查看战报]" autoSize="none" x="700" y="2" style="重要提示橘黄" var="txt_playback" width="100" height="18" align="right" underline="true"/>
			  <Label text="[查看战报]" autoSize="none" x="600" y="2" style="重要提示橘黄" var="txt_getBack" width="100" height="18" align="right" underline="true" visible="false"/>
			</View>;
       
      
      public var txt_new:Label = null;
      
      public var txt_time:Label = null;
      
      public var txt_content:Label = null;
      
      public var txt_playback:Label = null;
      
      public var txt_getBack:Label = null;
      
      public function FunnyEventRenderUI()
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
