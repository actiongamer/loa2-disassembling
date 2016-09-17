package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.LinkButton;
   
   public class FightReportListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="485" height="19">
			  <Label text="普通说明" autoSize="none" x="0" y="1" style="普通说明" width="130" height="18" var="txt_time"/>
			  <Label text="普通说明" autoSize="none" x="135" y="1" style="普通说明" width="347" height="18" var="txt_info"/>
			  <LinkButton label="查看战报" x="433" y="-3" labelColors="0xffff00,0xffff00,0xffff00" var="btn_view" lgx="433,433,433,433,433,433,433,483" lgy="-3,-3,-3,-3,-3,-3,-3,-3" language="ru"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_info:Label = null;
      
      public var btn_view:LinkButton = null;
      
      public function FightReportListRenderUI()
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
