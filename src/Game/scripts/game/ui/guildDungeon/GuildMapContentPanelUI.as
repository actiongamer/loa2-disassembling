package game.ui.guildDungeon
{
   import morn.customs.components.PanelView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.guildDungeon.render.GuildDungeonBuffRenderUI;
   import game.ui.guildDungeon.render.GuildDungeonRenderUI;
   
   public class GuildMapContentPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="1000" height="570">
			  <Image skin="png.uiGuildDungeon.img_titleBg" x="340" y="7"/>
			  <Label text="第三章 深渊恶魔" autoSize="left" x="340" var="txt_title" y="13" width="320" height="23.611465187072753" align="center" style="普通说明" size="15" bold="true"/>
			  <List var="list_map" y="0">
			    <GuildDungeonRender name="render" runtime="game.ui.guildDungeon.render.GuildDungeonRenderUI"/>
			  </List>
			  <Button skin="png.a5.commonImgs.btn_target" x="917" y="498" stateNum="1" var="btn_select"/>
			  <Button skin="png.a5.commonImgs.btn_rank" x="817" y="498" stateNum="1" var="btn_rank"/>
			  <Label text="\l40710104" x="779" width="127" style="渐变1" align="center" var="txt_rank" multiline="true" wordWrap="true" height="45" y="525"/>
			  <Label text="\l40710105" x="890" width="111" style="渐变1" align="center" var="txt_select" multiline="true" wordWrap="true" height="45" y="525"/>
			  <Label x="19" y="76" width="155" height="20" text="\l40710103" var="txt_leftTimes" style="普通绿色" align="left"/>
			  <Label x="19.5" y="127" width="200" height="20" text="\l40710102" var="txt_resetTime" style="不足禁止红" align="left"/>
			  <Label x="19" y="10" width="217" height="20" text="\l40710101" style="普通绿色"/>
			  <List x="19" y="28" var="list_buff" repeatX="4" spaceX="3">
			    <GuildDungeonBuffRender x="0" y="0" name="render" runtime="game.ui.guildDungeon.render.GuildDungeonBuffRenderUI"/>
			  </List>
			  <Button skin="png.a5.comps.numBars.btn_plus" x="114" y="73" var="btn_buyTimes" stateNum="1" lgx="164,114" lgy="73,73" language="en"/>
			</PanelView>;
       
      
      public var txt_title:Label = null;
      
      public var list_map:List = null;
      
      public var btn_select:Button = null;
      
      public var btn_rank:Button = null;
      
      public var txt_rank:Label = null;
      
      public var txt_select:Label = null;
      
      public var txt_leftTimes:Label = null;
      
      public var txt_resetTime:Label = null;
      
      public var list_buff:List = null;
      
      public var btn_buyTimes:Button = null;
      
      public function GuildMapContentPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonBuffRenderUI"] = GuildDungeonBuffRenderUI;
         viewClassMap["game.ui.guildDungeon.render.GuildDungeonRenderUI"] = GuildDungeonRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
