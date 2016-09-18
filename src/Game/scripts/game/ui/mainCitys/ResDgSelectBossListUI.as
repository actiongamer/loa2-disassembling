package game.ui.mainCitys
{
   import morn.customs.components.PanelView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ResDgSelectBossListUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView var="selectBossList" width="240" height="522">
			  <PanelBg x="0" y="0" width="240" height="522" bgBMargin="10,35,10,140"/>
			  <List x="22" y="49" repeatY="5" spaceY="10" var="list1" width="206" height="315">
			    <ResDgSelectBossListRender name="render" runtime="game.ui.mainCitys.ResDgSelectBossListRenderUI"/>
			  </List>
			  <ResBgBtnEnter x="27" y="406" var="box_btn" runtime="game.ui.mainCitys.ResBgBtnEnterUI"/>
			  <Label text="今日剩余次数3/3" autoSize="left" x="63" y="386" color="0xc2beaf" size="12" var="txt_levelTimes" height="18"/>
			  <Button label="" stateNum="1" buttonMode="true" skin="png.uiMainCitys.resDgSelectBosses.btn_add" x="162" y="385" var="btn_add"/>
			</PanelView>;
       
      
      public var selectBossList:PanelView = null;
      
      public var list1:List = null;
      
      public var box_btn:game.ui.mainCitys.ResBgBtnEnterUI = null;
      
      public var txt_levelTimes:Label = null;
      
      public var btn_add:Button = null;
      
      public function ResDgSelectBossListUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mainCitys.ResBgBtnEnterUI"] = game.ui.mainCitys.ResBgBtnEnterUI;
         viewClassMap["game.ui.mainCitys.ResDgSelectBossListRenderUI"] = ResDgSelectBossListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
