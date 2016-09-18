package game.ui.npcFuncLists
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class NpcFuncListModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="368" height="554">
			  <PanelBg width="368" height="554" x="0" y="0"/>
			  <Image skin="png.uiNpcFuncLists.背景角" x="4.5" y="30" var="img_bg"/>
			  <NpcFuncListPlayerIcon x="-35" y="-20" var="playIcon" runtime="game.ui.npcFuncLists.NpcFuncListPlayerIconUI"/>
			  <Label text="剩余时间:" autoSize="none" x="219" y="31" style="普通绿色" width="133" height="18" var="txt_activeCd" align="left"/>
			  <Label text="普通说明" autoSize="none" x="84" y="28" style="普通说明" width="138" height="24" align="center" var="txt_activeName" size="14"/>
			  <Image skin="png.uiNpcFuncLists.气泡框" x="58" y="47"/>
			  <Label text="今日守护女神" autoSize="none" x="85" y="63" style="重要提示黄" width="250" height="54" align="center" var="txt_prompt1" size="16" multiline="true" wordWrap="true" language="en" lgx="85,85" lgy="50,63"/>
			  <Label text="普通\n说明" autoSize="none" x="139" y="516" style="普通说明" width="194" height="36" align="left" var="txt_help" wordWrap="true" multiline="true"/>
			  <List x="16" y="96" repeatY="5" spaceY="0" var="list" width="346">
			    <NpcFuncListRenderFake name="render" runtime="game.ui.npcFuncLists.NpcFuncListRenderFakeUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var playIcon:game.ui.npcFuncLists.NpcFuncListPlayerIconUI = null;
      
      public var txt_activeCd:Label = null;
      
      public var txt_activeName:Label = null;
      
      public var txt_prompt1:Label = null;
      
      public var txt_help:Label = null;
      
      public var list:List = null;
      
      public function NpcFuncListModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.npcFuncLists.NpcFuncListPlayerIconUI"] = game.ui.npcFuncLists.NpcFuncListPlayerIconUI;
         viewClassMap["game.ui.npcFuncLists.NpcFuncListRenderFakeUI"] = NpcFuncListRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
