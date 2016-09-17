package game.ui.guildModules.verify
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   
   public class GuildVerifyPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="599" height="431">
			  <PanelBgS3 width="599" height="431"/>
			  <Image skin="png.uiGuildModule.manage.标题头" x="18" y="74"/>
			  <List x="19" y="103" spaceY="34" repeatY="4" var="list_bg">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.公会排行底" height="30" width="559"/>
			    </Box>
			  </List>
			  <List x="19" y="102" spaceY="30" repeatY="8" var="list_line">
			    <Box name="render">
			      <Image skin="png.uiGuildModule.线" x="0" y="0" width="560"/>
			    </Box>
			  </List>
			  <Label text="\l11000854" autoSize="none" x="42" y="81" bold="true" width="113" height="18" style="重要提示黄" align="center"/>
			  <Label text="公会人数" autoSize="left" x="24" y="49" bold="false" height="18" var="txt_cnt" style="普通说明"/>
			  <PageBarS2 x="422" y="383" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l11000861" stateNum="1" buttonMode="true" labelFont="SSZH" x="37" y="383" var="btn_acceptAll" style="按钮中绿"/>
			  <Button label="\l11000862" stateNum="1" buttonMode="true" labelFont="SSZH" x="150" y="383" var="btn_denyAll" style="按钮中红"/>
			  <List x="19" y="105" var="list_apply" repeatY="8" spaceY="2">
			    <GuildVerifyListRender name="render" runtime="game.ui.guildModules.verify.GuildVerifyListRenderUI"/>
			  </List>
			  <CheckBox label="\l11000853" y="46" labelColors="0xebe5d6" labelSize="12" var="cbx_auto" style="CheckBox普通" right="20"/>
			  <Label text="\l11000855" autoSize="none" x="142" y="81" bold="true" width="113" height="18" style="重要提示黄" align="center"/>
			  <Label text="\l11000856" autoSize="none" x="218" y="81" bold="true" width="113" height="18" style="重要提示黄" align="center"/>
			  <Label text="\l11000857" autoSize="none" x="307" y="81" bold="true" width="113" height="18" style="重要提示黄" align="center"/>
			  <Label text="\l11000858" autoSize="none" x="438" y="81" bold="true" width="113" height="18" style="重要提示黄" align="center"/>
			</PopModuleView>;
       
      
      public var list_bg:List = null;
      
      public var list_line:List = null;
      
      public var txt_cnt:Label = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var btn_acceptAll:Button = null;
      
      public var btn_denyAll:Button = null;
      
      public var list_apply:List = null;
      
      public var cbx_auto:CheckBox = null;
      
      public function GuildVerifyPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildModules.verify.GuildVerifyListRenderUI"] = GuildVerifyListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
