package game.ui.championship
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import game.ui.championship.comp.CompeteRecordListRenderUI;
   
   public class ChampionCompeteRecordPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="802" height="544">
			  <PanelBg x="0" y="0" width="802" height="554"/>
			  <Image skin="png.uiChampionship.黑色透明底04" x="24" y="35" width="732" height="29"/>
			  <List x="26" y="97" width="750" repeatY="13" spaceY="30">
			    <Box name="render">
			      <Image skin="png.a5.commonImgs.列表分割线" width="750"/>
			    </Box>
			  </List>
			  <Label text="\l50400501" autoSize="none" x="109" y="43" style="下划线黄色" width="212" height="18" align="center"/>
			  <Label text="\l50400502" autoSize="none" x="462" y="43" style="下划线黄色" width="212" height="18" align="center"/>
			  <PageBarS2 x="323" y="505" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="125" y="71" var="list_record" repeatY="13" spaceY="2">
			    <CompeteRecordListRender name="render" runtime="game.ui.championship.comp.CompeteRecordListRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var pageBar:PageBarS2UI = null;
      
      public var list_record:List = null;
      
      public function ChampionCompeteRecordPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.CompeteRecordListRenderUI"] = CompeteRecordListRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
