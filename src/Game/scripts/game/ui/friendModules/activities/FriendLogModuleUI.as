package game.ui.friendModules.activities
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   
   public class FriendLogModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="686" height="440">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="686" height="440" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="36" bottom="56"/>
			  <Image skin="png.uiFriend.mains.上分割线" x="93" y="19" width="500" height="27"/>
			  <Image skin="png.uiFriend.mains.下分割线" x="93" y="74" width="500"/>
			  <Label text="提示信息" autoSize="none" x="215" y="48" style="普通说明暗色" width="252" align="center" var="txt_propmt2" height="20"/>
			  <Label text="提示信息" autoSize="none" x="38" y="48" style="普通说明暗色" width="236" align="left" var="txt_propmt1" height="20"/>
			  <Label text="提示信息" autoSize="none" x="481" y="48" style="普通说明暗色" width="147" align="right" var="txt_propmt3" height="20"/>
			  <Button label="全部同意" buttonMode="true" labelFont="SSZH" x="540" y="394" var="btn_doAll" style="按钮中绿"/>
			  <PageBarS2 x="270" y="398" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="22" y="93" var="list_log" repeatY="10" spaceY="-1" width="640" height="273">
			    <FriendLogRender name="render" runtime="game.ui.friendModules.activities.FriendLogRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_propmt2:Label = null;
      
      public var txt_propmt1:Label = null;
      
      public var txt_propmt3:Label = null;
      
      public var btn_doAll:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_log:List = null;
      
      public function FriendLogModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.friendModules.activities.FriendLogRenderUI"] = FriendLogRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
