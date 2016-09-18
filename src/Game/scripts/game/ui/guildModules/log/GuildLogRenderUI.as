package game.ui.guildModules.log
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GuildLogRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="20">
			  <Label text="[2014--11-02 20:00:00 ]" autoSize="left" x="7" y="2" width="155" var="txt_time" style="小标题"/>
			  <Label text="[2014--11-02 20:00:00 ]" autoSize="left" x="150" y="2" width="445" var="txt_log" style="普通说明" height="20"/>
			</View>;
       
      
      public var txt_time:Label = null;
      
      public var txt_log:Label = null;
      
      public function GuildLogRenderUI()
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
