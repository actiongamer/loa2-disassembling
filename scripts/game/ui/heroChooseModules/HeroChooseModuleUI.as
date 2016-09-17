package game.ui.heroChooseModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Button;
   
   public class HeroChooseModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="541" height="400">
			  <PanelBgS3 x="1" y="3" width="542" height="400" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.uiHeroChoose.img_bg" x="12" y="35"/>
			  <Label text="你已经到达70级，可以跨阵营转换英雄，请先选择阵营！" y="52" style="普通说明" height="20" var="txt_alert" autoSize="center" x="15" width="513" align="center"/>
			  <List x="55" y="93" var="list_groups" repeatX="3" spaceX="15">
			    <HeroGroupRender name="render" runtime="game.ui.heroChooseModules.HeroGroupRenderUI"/>
			  </List>
			  <Box x="43" y="93" var="box_hero">
			    <List var="list_heros" repeatX="4" spaceX="23">
			      <HeroChooseRender name="render" runtime="game.ui.heroChooseModules.HeroChooseRenderUI"/>
			    </List>
			    <PageBarS1 x="185" y="217" var="pageBar" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			    <Button label="确认" x="85" style="按钮大绿" y="265" var="btn_confirm"/>
			    <Button label="返回" x="263" style="按钮大黄" y="265" var="btn_back"/>
			  </Box>
			</PopModuleView>;
       
      
      public var txt_alert:Label = null;
      
      public var list_groups:List = null;
      
      public var box_hero:Box = null;
      
      public var list_heros:List = null;
      
      public var pageBar:PageBarS1UI = null;
      
      public var btn_confirm:Button = null;
      
      public var btn_back:Button = null;
      
      public function HeroChooseModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.heroChooseModules.HeroChooseRenderUI"] = HeroChooseRenderUI;
         viewClassMap["game.ui.heroChooseModules.HeroGroupRenderUI"] = HeroGroupRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
