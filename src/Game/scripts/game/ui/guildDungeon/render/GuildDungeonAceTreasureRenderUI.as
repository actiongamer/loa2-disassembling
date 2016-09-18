package game.ui.guildDungeon.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildDungeonAceTreasureRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="80">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="0" var="img_quality" y="0" sizeGrid="8,8,8,8" width="60" height="60"/>
			  <Image skin="png.a5.comps.img_block" x="3" y="3" width="54" height="54" var="img_icon"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="46" align="right" x="11" y="41" style="普通说明"/>
			  <Label text="玩家姓名" x="-10.5" y="63" width="81" height="18" var="txt_playerName" style="普通说明" align="center"/>
			  <Image skin="png.a5.commonImgs.img_hasReward" x="-7" y="5" var="img_hasReward"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_playerName:Label = null;
      
      public var img_hasReward:Image = null;
      
      public function GuildDungeonAceTreasureRenderUI()
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
