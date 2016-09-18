package game.ui.activities
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class ActivityExchangeUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="382" height="270">
			  <PanelBgS3 x="0" y="0" btnCloseStyle="1" width="382" height="270"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="12" y="36" width="357" height="144" sizeGrid="20,20,20,20" left="14" right="14" bottom="56" top="36"/>
			  <Button label="取消取消" style="按钮中绿" var="btn_ok" x="144" y="227"/>
			  <NumBarS1 x="132" y="169" var="numBar" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Box x="92" y="78" var="box_exchange">
			    <List x="138" repeatX="1" spaceX="6" var="list_reward">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <List repeatX="1" spaceX="6" var="list_cost">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Image skin="png.a5.commonImgs.img_arrowRight" x="71" y="9" var="img_arrow"/>
			  </Box>
			</PopModuleView>;
       
      
      public var btn_ok:Button = null;
      
      public var numBar:NumBarS1UI = null;
      
      public var box_exchange:Box = null;
      
      public var list_reward:List = null;
      
      public var list_cost:List = null;
      
      public var img_arrow:Image = null;
      
      public function ActivityExchangeUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
