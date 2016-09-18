package game.ui.recycleModules.heroRecycle
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.btns.BtnOkUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.RedPointNumUI;
   import game.ui.recycleModules.render.RecSelectHeroRenderUI;
   
   public class RecSelectHeroPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="548" height="390">
			  <PanelBgS3 width="548" height="390" x="0" frameStyle="1"/>
			  <BtnOk x="232.5" y="349" var="btnOK" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <Box x="31" y="355" var="box_num" visible="false">
			    <Label text="选中英雄数量：" autoSize="left" style="普通说明" width="91" height="18"/>
			    <Label text="1/6" autoSize="left" x="83" y="1" style="普通绿色" width="61" height="18" var="txt_selectedNum"/>
			  </Box>
			  <List x="20" y="43" repeatX="2" repeatY="3" spaceX="3" spaceY="4" width="506" height="279" var="list_hero" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3">
			    <RecSelectHeroRender name="render" runtime="game.ui.recycleModules.render.RecSelectHeroRenderUI"/>
			  </List>
			  <RedPointNum x="302" y="341" var="countPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</PopModuleView>;
       
      
      public var btnOK:BtnOkUI = null;
      
      public var box_num:Box = null;
      
      public var txt_selectedNum:Label = null;
      
      public var list_hero:List = null;
      
      public var countPoint:RedPointNumUI = null;
      
      public function RecSelectHeroPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.recycleModules.render.RecSelectHeroRenderUI"] = RecSelectHeroRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
