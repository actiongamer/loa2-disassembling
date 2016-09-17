package game.ui.arenas.rewards
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   
   public class ArenaRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="388" height="526">
			  <PanelBgS3 width="388" height="526" x="0" frameStyle="1" frameVisible="true"/>
			  <Label text="第一名" autoSize="none" x="17" y="485" style="普通说明" var="txt_refreshTime" align="left" width="131" height="18"/>
			  <Button label="领  取" x="153" y="482" style="按钮中绿" var="btn_get" width="100"/>
			  <Image skin="png.uiArenas.选中框" x="47.5" y="39" width="293" height="25"/>
			  <Label text="昨日积分:" autoSize="none" x="19" y="43" style="普通说明" var="txt_tip" align="right" width="195" height="18"/>
			  <Label text="139" autoSize="none" x="217" y="42" style="渐变2" var="txt_myRank" align="left" width="150"/>
			  <List x="17" y="65" var="list" repeatY="5">
			    <ArenaRewardRenderFake name="render" runtime="game.ui.arenas.rewards.ArenaRewardRenderFakeUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var txt_refreshTime:Label = null;
      
      public var btn_get:Button = null;
      
      public var txt_tip:Label = null;
      
      public var txt_myRank:Label = null;
      
      public var list:List = null;
      
      public function ArenaRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.rewards.ArenaRewardRenderFakeUI"] = ArenaRewardRenderFakeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
