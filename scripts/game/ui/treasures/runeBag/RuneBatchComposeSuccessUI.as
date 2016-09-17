package game.ui.treasures.runeBag
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.GRect;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.ClickToNextUI;
   import game.ui.treasures.render.RuneBigRenderUI;
   
   public class RuneBatchComposeSuccessUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView var="img_bg" width="2000" height="1000">
			  <GRect fillAlpha="0.4" radius="0,0,0,0" lineAlpha="0" width="2000" height="1000" lineColor="0x0" fillColor="0x0" var="img_cover"/>
			  <Box x="786.5" y="407" var="box_bg" width="427" height="186">
			    <PanelBgS4 btnCloseStyle="2" y="0" x="0"/>
			    <Label text="合成成功" autoSize="none" x="68" y="21" style="二级框标题" width="290" height="28" align="center" var="txt_title"/>
			    <List x="10" y="53" repeatX="6" spaceX="10" var="list_item">
			      <RuneBigRender name="render" runtime="game.ui.treasures.render.RuneBigRenderUI"/>
			    </List>
			  </Box>
			  <ClickToNext x="924.5" y="600" var="box_clickNext" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			</PopModuleView>;
       
      
      public var img_bg:PopModuleView = null;
      
      public var img_cover:GRect = null;
      
      public var box_bg:Box = null;
      
      public var txt_title:Label = null;
      
      public var list_item:List = null;
      
      public var box_clickNext:ClickToNextUI = null;
      
      public function RuneBatchComposeSuccessUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         viewClassMap["game.ui.treasures.render.RuneBigRenderUI"] = RuneBigRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
