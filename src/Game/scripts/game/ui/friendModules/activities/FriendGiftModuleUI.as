package game.ui.friendModules.activities
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class FriendGiftModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="454" height="440">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="454" height="440" x="0" y="0"/>
			  <Tab x="26" y="39" style="TAB超长" labels="label1,label2" selectedIndex="0" var="tab1"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="61" bottom="56"/>
			  <PageBarS1 x="180" y="399" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Button label="一键XX" buttonMode="true" labelFont="SSZH" x="333" y="394" var="btn_doAll" style="按钮中绿"/>
			  <List x="23" y="73" repeatY="6" spaceY="4" var="list_player">
			    <FriendGiftRender name="render" runtime="game.ui.friendModules.activities.FriendGiftRenderUI"/>
			  </List>
			  <Label text="战力:xxx" x="219" y="42" var="txt_prompt" width="218" height="18" style="普通说明暗色" align="right"/>
			  <RedPointNum y="31" x="211" var="redPoiGift2UI" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</PopModuleView>;
       
      
      public var tab1:Tab = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_doAll:Button = null;
      
      public var list_player:List = null;
      
      public var txt_prompt:Label = null;
      
      public var redPoiGift2UI:RedPointNumUI = null;
      
      public function FriendGiftModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.friendModules.activities.FriendGiftRenderUI"] = FriendGiftRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
