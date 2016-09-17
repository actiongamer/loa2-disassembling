package game.ui.guildDungeon
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.guildDungeon.render.GuildDungeonAceTreasureRenderUI;
   import game.ui.guildDungeon.render.GuildDungeonTreasureFloorRenderUI;
   
   public class GuildDungeonTreasureModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBgS3 x="1" y="-1" width="598" height="432" frameStyle="2"/>
			  <Image skin="png.uiGuildDungeon.img_treasureBg" x="13" y="36"/>
			  <List x="53" y="99" repeatY="3" width="80" var="list_aceReward" spaceY="25">
			    <GuildDungeonAceTreasureRender x="24" y="6" name="render" runtime="game.ui.guildDungeon.render.GuildDungeonAceTreasureRenderUI"/>
			  </List>
			  <Label text="\l40710202" x="15" y="49" width="143" height="36" style="升级后加底标题" wordWrap="true" align="center"/>
			  <Label x="154" y="37" width="425" style="普通绿色" wordWrap="true" align="center" var="txt_title"/>
			  <Image skin="png.a5.commonImgs.列表分割线" x="159" y="81" width="402"/>
			  <List x="151" y="87" repeatY="3" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="431" var="list_reward" spaceX="24" spaceY="17" height="298">
			    <GuildDungeonTreasureFloorRender x="-25" y="-8" name="render" runtime="game.ui.guildDungeon.render.GuildDungeonTreasureFloorRenderUI"/>
			  </List>
			  <Label x="154" y="60" width="425" style="不足禁止红" wordWrap="true" align="center" var="txt_timer"/>
			  <Label text="\l40710517" x="176" y="217" width="381" height="69" style="渐变1" wordWrap="true" align="center" var="txt_alert" size="22" multiline="true"/>
			</PopModuleView>;
       
      
      public var list_aceReward:List = null;
      
      public var txt_title:Label = null;
      
      public var list_reward:List = null;
      
      public var txt_timer:Label = null;
      
      public var txt_alert:Label = null;
      
      public function GuildDungeonTreasureModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonAceTreasureRenderUI"] = GuildDungeonAceTreasureRenderUI;
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonTreasureFloorRenderUI"] = GuildDungeonTreasureFloorRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
