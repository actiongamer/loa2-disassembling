package game.ui.guildModules.guildRank
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class GuildDetialInfoPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="597" height="466">
			  <PanelBgS3 y="0" width="597" height="466" frameStyle="2" x="0"/>
			  <Label text="\l11800203" autoSize="left" x="28" y="50" style="普通说明"/>
			  <Label text="今日开放测试" autoSize="none" x="88" y="50" style="重要提示橘黄" width="119" height="18" align="left" var="txt_name"/>
			  <Label text="\l40700012" autoSize="left" x="28" y="72" style="普通说明"/>
			  <Label text="普通说明" autoSize="none" x="88" y="72" style="重要提示橘黄" width="119" height="18" align="left" var="txt_owner"/>
			  <List x="17" y="128" spaceY="34" repeatY="5" var="list_bg" mouseEnabled="false" mouseChildren="false">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.公会排行底" height="30" x="0" y="0" width="562"/>
			    </Box>
			  </List>
			  <HBox y="50" right="25" x="451">
			    <Label text="\l40700034 " autoSize="left" style="普通说明" x="0" y="0"/>
			    <Label autoSize="none" style="重要提示橘黄" align="left" x="0" y="0" width="10"/>
			    <Label text="12/23" autoSize="none" style="重要提示橘黄" align="left" var="txt_memberNum"/>
			  </HBox>
			  <HBox x="248" y="50">
			    <Label text="\l40700033 " autoSize="left" style="普通说明" x="0" y="0" width="72" height="19"/>
			    <Label autoSize="none" style="重要提示橘黄" align="left" x="10" y="0" width="10"/>
			    <Label text="1" autoSize="none" style="重要提示橘黄" align="left" var="txt_rank" x="0" y="0"/>
			  </HBox>
			  <Image skin="png.a5.commonImgs.排行标题头" x="18" y="96" width="560" height="28"/>
			  <List x="17" y="125" repeatY="10" spaceY="30" mouseChildren="false" mouseEnabled="false">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.列表分割线" name="render" width="562"/>
			    </Box>
			  </List>
			  <Label text="\l11000802" autoSize="none" x="80" y="102" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l2035" autoSize="none" x="206" y="102" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l40700022" autoSize="none" x="312" y="102" style="下划线黄色" width="65" height="18" align="center" bold="true"/>
			  <Label text="\l41210104" autoSize="none" x="442" y="104" style="下划线黄色" width="120" height="18" align="center" bold="true"/>
			  <List x="17" y="125" spaceY="2" var="list_member" repeatY="9">
			    <GuildDetailMemListRender name="render" runtime="game.ui.guildModules.guildRank.GuildDetailMemListRenderUI"/>
			  </List>
			  <PageBarS2 x="235" y="420" var="pageBar" centerX="0" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <HBox x="247" y="72">
			    <Label text="\l11800506" autoSize="left" style="普通说明"/>
			    <Label autoSize="none" style="重要提示橘黄" align="left" x="0" y="0" width="10"/>
			    <Label text="12" autoSize="none" style="重要提示橘黄" align="left" var="txt_level" x="0" y="0"/>
			  </HBox>
			</PopModuleView>;
       
      
      public var txt_name:Label = null;
      
      public var txt_owner:Label = null;
      
      public var list_bg:List = null;
      
      public var txt_memberNum:Label = null;
      
      public var txt_rank:Label = null;
      
      public var list_member:List = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var txt_level:Label = null;
      
      public function GuildDetialInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.guildRank.GuildDetailMemListRenderUI"] = GuildDetailMemListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
