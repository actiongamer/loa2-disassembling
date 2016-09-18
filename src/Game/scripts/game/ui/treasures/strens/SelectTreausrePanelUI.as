package game.ui.treasures.strens
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.btns.BtnOkUI;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.treasures.render.SelectTreasureRenderUI;
   
   public class SelectTreausrePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="548" height="397">
			  <PanelBgS3 x="0" width="548" height="390" y="0"/>
			  <BtnOk x="232.5" y="349" var="btnOK" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="20,20,20,20" top="33" bottom="60" left="13" right="13"/>
			  <List x="18" y="46" repeatX="2" repeatY="3" spaceX="3" spaceY="4" width="510" height="280" var="list_treasure" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <SelectTreasureRender name="render" runtime="game.ui.treasures.render.SelectTreasureRenderUI"/>
			  </List>
			  <Box x="286" y="343" mouseChildren="false" mouseEnabled="false">
			    <Image skin="png.a5.commonImgs.img_redPointBig" x="14"/>
			    <Label text="1" autoSize="none" y="6" style="随品质变化" width="53" height="18" align="center" var="txt_num" font="SimSun"/>
			  </Box>
			</PopModuleView>;
       
      
      public var btnOK:BtnOkUI = null;
      
      public var list_treasure:List = null;
      
      public var txt_num:Label = null;
      
      public function SelectTreausrePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.treasures.render.SelectTreasureRenderUI"] = SelectTreasureRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
