package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GuildDungeonTreasureRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="70" height="71">
			  <Label text="玩家姓名" x="-5.5" y="53" width="81" height="18" var="txt_playerName" style="普通说明" align="center"/>
			  <Button skin="png.uiGuildDungeon.btn_treasureOpen" x="-1" y="-19" stateNum="1" var="btn_treasure"/>
			  <List x="8" y="-10" var="list_reward" width="50" height="50">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="\l41500014" x="-5" y="14" width="81" height="22" var="txt_alert" style="渐变1" align="center"/>
			</View>;
       
      
      public var txt_playerName:Label = null;
      
      public var btn_treasure:Button = null;
      
      public var list_reward:List = null;
      
      public var txt_alert:Label = null;
      
      public function GuildDungeonTreasureRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
