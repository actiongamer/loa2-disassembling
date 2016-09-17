package game.ui.teamPKCS.finalMatch
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TPKCFightResultRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="20">
			  <Label text="[12:25:30] " autoSize="none" x="114" y="1" style="普通说明" var="txt_time"/>
			  <Label text="\l999900287" autoSize="none" x="465" y="0" style="下划线黄色" underline="true" var="txt_seereport"/>
			  <Label autoSize="none" x="203" y="1" style="普通说明" var="txt_info" text="第一场 红伞输给了 克莱斯节课"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_seereport:Label = null;
      
      public var txt_info:Label = null;
      
      public function TPKCFightResultRenderUI()
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
