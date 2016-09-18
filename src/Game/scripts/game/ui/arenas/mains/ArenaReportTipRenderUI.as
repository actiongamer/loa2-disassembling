package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class ArenaReportTipRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="429" height="22">
			  <Label text="事件内容" autoSize="left" x="156" y="3" style="普通说明" var="txt_content"/>
			  <Label text="NEW" autoSize="none" x="400" y="3" style="不足禁止红" var="txt_new" width="35" height="18" align="left"/>
			  <Label text="[ 2011-12-13 13:14:14 ]" autoSize="left" x="20" y="3" style="普通说明" width="140" height="18" var="txt_time"/>
			  <Image skin="png.uiArenas.reportIcon" x="0" y="0"/>
			</View>;
       
      
      public var txt_content:Label = null;
      
      public var txt_new:Label = null;
      
      public var txt_time:Label = null;
      
      public function ArenaReportTipRenderUI()
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
