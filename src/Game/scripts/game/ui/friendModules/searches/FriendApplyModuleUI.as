package game.ui.friendModules.searches
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Label;
   
   public class FriendApplyModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="590" height="474">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="590" height="474" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="36" bottom="90"/>
			  <List repeatX="1" repeatY="6" var="list_player" spaceY="4" x="23" y="72">
			    <FriendApplyRender name="render" x="0" y="0" runtime="game.ui.friendModules.searches.FriendApplyRenderUI"/>
			  </List>
			  <Button label="全部拒绝" buttonMode="true" labelFont="SSZH" x="166" y="426" var="btn_refuseAll" style="按钮中红"/>
			  <Button label="全部同意" buttonMode="true" labelFont="SSZH" x="330" y="426" var="btn_agreeAll" style="按钮中绿"/>
			  <PageBarS2 x="222" y="393" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Image skin="png.uiFriend.mains.上分割线" x="45" y="36" width="500" height="27"/>
			  <Image skin="png.uiFriend.mains.下分割线" x="45" y="37" width="500"/>
			  <Label text="提示信息" autoSize="none" x="72" y="42" style="普通说明暗色" width="442" align="center" var="txt_propmt" height="22"/>
			</PopModuleView>;
       
      
      public var list_player:List = null;
      
      public var btn_refuseAll:Button = null;
      
      public var btn_agreeAll:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var txt_propmt:Label = null;
      
      public function FriendApplyModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.friendModules.searches.FriendApplyRenderUI"] = FriendApplyRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
