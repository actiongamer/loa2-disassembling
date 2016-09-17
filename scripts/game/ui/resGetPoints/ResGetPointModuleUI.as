package game.ui.resGetPoints
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class ResGetPointModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="380" height="326">
			  <PanelBgS3 x="0" y="0" width="380" height="326"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="19" y="113" sizeGrid="20,20,20,20" top="33" left="11" right="11" bottom="11"/>
			  <Box x="25" y="50" var="con_con">
			    <ResGetPointResRender var="resRender" runtime="game.ui.resGetPoints.ResGetPointResRenderUI"/>
			    <List y="83" repeatY="3" spaceY="0" var="list_points" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" x="5" width="329" height="174">
			      <ResGetPointListRender name="render" runtime="game.ui.resGetPoints.ResGetPointListRenderUI"/>
			    </List>
			    <Label stroke="0xffffff" mouseEnabled="false" var="txt_desc" align="center" x="20" y="41" backgroundColor="0xcfbeaf" width="293" multiline="false" isHtml="true" style="小标题" size="16" height="49" text="999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999" wordWrap="true"/>
			    <Label text="语言包提示文字" color="0xeac472" stroke="0xffffff" mouseEnabled="false" var="txt_errorTip" align="center" x="1" y="19" backgroundColor="0xcfbeaf" size="15" autoSize="center" width="327" multiline="true" wordWrap="true" isHtml="true" height="25"/>
			  </Box>
			  <List x="25" y="46" repeatY="3" spaceY="5" var="list_items">
			    <ResGetPointResRender name="render" runtime="game.ui.resGetPoints.ResGetPointResRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var con_con:Box = null;
      
      public var resRender:game.ui.resGetPoints.ResGetPointResRenderUI = null;
      
      public var list_points:List = null;
      
      public var txt_desc:Label = null;
      
      public var txt_errorTip:Label = null;
      
      public var list_items:List = null;
      
      public function ResGetPointModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.resGetPoints.ResGetPointListRenderUI"] = ResGetPointListRenderUI;
         viewClassMap["game.ui.resGetPoints.ResGetPointResRenderUI"] = game.ui.resGetPoints.ResGetPointResRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
