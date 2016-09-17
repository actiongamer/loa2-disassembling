package game.ui.friendModules.searches
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class FriendRecommendModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="450" height="440">
			  <PanelBgS3 bgBMargin="10,35,10,60" width="450" height="440" x="0" y="0"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="36" bottom="56"/>
			  <List x="23" y="72" repeatX="1" repeatY="6" var="list_player" spaceY="4">
			    <FriendRecommendRender name="render" x="0" y="0" runtime="game.ui.friendModules.searches.FriendRecommendRenderUI"/>
			  </List>
			  <Button buttonMode="true" labelFont="SSZH" x="95" y="393" var="btn_next" style="按钮中黄" label="换一批"/>
			  <Button label="全部添加" stateNum="1" buttonMode="true" labelFont="SSZH" x="261" y="392" var="btn_applyAll" style="按钮中绿"/>
			  <Image skin="png.uiFriend.mains.下分割线" x="53" y="38"/>
			  <Image skin="png.uiFriend.mains.上分割线" x="52" y="37"/>
			  <Label text="提示信息" autoSize="none" x="5" y="43" style="普通说明暗色" width="440" height="18" align="center" var="txt_propmt"/>
			</PopModuleView>;
       
      
      public var list_player:List = null;
      
      public var btn_next:Button = null;
      
      public var btn_applyAll:Button = null;
      
      public var txt_propmt:Label = null;
      
      public function FriendRecommendModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.friendModules.searches.FriendRecommendRenderUI"] = FriendRecommendRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
