package game.ui.TencentModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.TencentModule.render.TencentTitleRenderUI;
   
   public class TencentVipModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="803" height="551">
			  <PanelBg x="0" y="0" width="804" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="195" y="41" width="595" height="122" var="img_bg"/>
			  <Image skin="png.a5.comps.img_block" x="193" y="134" width="596" height="407" var="img_backpanel"/>
			  <List x="23" y="45" var="list_title" repeatY="4" spaceY="6">
			    <TencentTitleRender name="render" runtime="game.ui.TencentModule.render.TencentTitleRenderUI"/>
			  </List>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="622" y="45" width="164" height="28" var="txt_toQQVipOfficalBg"/>
			  <Label text="更多特权，请关注" autoSize="none" x="556" y="50" style="普通说明" width="226" height="20" align="right" var="txt_toQQVipOffical"/>
			  <RedPoint x="176" y="40" var="redPoi_newer" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="176" y="92" var="redPoi_daily" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <RedPoint x="176" y="144" var="redPoi_lvUp" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_backpanel:Image = null;
      
      public var list_title:List = null;
      
      public var txt_toQQVipOfficalBg:GRect = null;
      
      public var txt_toQQVipOffical:Label = null;
      
      public var redPoi_newer:RedPointUI = null;
      
      public var redPoi_daily:RedPointUI = null;
      
      public var redPoi_lvUp:RedPointUI = null;
      
      public function TencentVipModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentTitleRenderUI"] = TencentTitleRenderUI;
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
