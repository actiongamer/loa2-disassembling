package game.ui.championship
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.championship.comp.GambleRecordListRenderUI;
   
   public class ChampionGambleRecordPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="802" height="544">
			  <PanelBg x="0" y="0" width="802" height="554"/>
			  <Image skin="png.uiChampionship.黑色透明底04" x="24" y="35" width="732" height="29"/>
			  <Label text="\l50400209" autoSize="none" x="41" y="507" style="普通说明" width="281" height="37" var="txt_content" multiline="true" lgx="41,41" lgy="497,507" language="en"/>
			  <List x="26" y="97" width="750" repeatY="13" spaceY="30">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.列表分割线" width="750"/>
			    </Box>
			  </List>
			  <Label text="\l50400401" autoSize="none" x="109" y="43" style="下划线黄色" width="212" height="18" align="center"/>
			  <Label text="\l50400402" autoSize="none" x="399" y="43" style="下划线黄色" width="212" height="18" align="center"/>
			  <Label text="\l50400403" autoSize="none" x="557" y="43" style="下划线黄色" width="212" height="18" align="center"/>
			  <PageBarS2 x="323" y="505" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="\l50400406" x="645" y="500" style="按钮中绿" var="btn_getAll"/>
			  <List x="41" y="67" var="list_record" repeatY="13" spaceY="2">
			    <GambleRecordListRender name="render" runtime="game.ui.championship.comp.GambleRecordListRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_content:Label = null;
      
      public var pageBar:PageBarS2UI = null;
      
      public var btn_getAll:Button = null;
      
      public var list_record:List = null;
      
      public function ChampionGambleRecordPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.GambleRecordListRenderUI"] = GambleRecordListRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
