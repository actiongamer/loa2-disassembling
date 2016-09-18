package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class GuildDungeonTreasureIconUI extends View
   {
      
      protected static var uiView:XML = <View width="160" height="160" buttonMode="true">
			  <Image skin="png.uiGuildDungeon.img_treasureIcon" x="0" y="0"/>
			  <Label text="\l9140723" x="1" y="3" width="160" height="23" align="center" style="二级框标题"/>
			  <RedPoint x="118" y="0" var="img_redPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</View>;
       
      
      public var img_redPoint:RedPointUI = null;
      
      public function GuildDungeonTreasureIconUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
