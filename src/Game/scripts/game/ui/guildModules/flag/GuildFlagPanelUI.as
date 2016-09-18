package game.ui.guildModules.flag
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Tab;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   
   public class GuildFlagPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="340">
			  <PanelBgS3 width="600" height="340" x="0" frameVisible="false"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="13" y="64" width="572" height="214" sizeGrid="20,20,20,20" left="11" right="11" bottom="60"/>
			  <Image skin="png.uiGuildModule.首页-旗帜无图" x="19" y="68"/>
			  <Box x="128" y="155">
			    <Image skin="png.comp.image" var="img_bg" anchorX=".5" anchorY=".5"/>
			    <Image skin="png.comp.image" var="img_pattern" anchorX=".5" anchorY=".5" x="3" y="0"/>
			  </Box>
			  <Image skin="png.uiGuildModule.manage.修改公告小底部9宫格" x="242" y="106" sizeGrid="10,10,10,10" width="334" height="165"/>
			  <Tab labels="," x="24" y="42" selectedIndex="0" var="tabBar" style="TAB暗红色"/>
			  <List x="273" y="126" repeatX="4" repeatY="2" spaceY="16" spaceX="22" var="list_flag">
			    <GuildFlagRender name="render" runtime="game.ui.guildModules.flag.GuildFlagRenderUI"/>
			  </List>
			  <Label text="升级后加底标题" autoSize="left" x="249" y="76" style="升级后加底标题" size="14" var="txt_title"/>
			  <Label text="Lv.56  女神联盟" autoSize="none" x="28" y="243" style="技能名标题" size="16" width="201" height="29" align="center" var="txt_name"/>
			  <HBox x="188.5" y="290" space="25">
			    <BtnCancel var="cancleBtn" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			    <BtnOk x="140" var="okBtm" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  </HBox>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_pattern:Image = null;
      
      public var tabBar:Tab = null;
      
      public var list_flag:List = null;
      
      public var txt_title:Label = null;
      
      public var txt_name:Label = null;
      
      public var cancleBtn:BtnCancelUI = null;
      
      public var okBtm:BtnOkUI = null;
      
      public function GuildFlagPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.guildModules.flag.GuildFlagRenderUI"] = GuildFlagRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
