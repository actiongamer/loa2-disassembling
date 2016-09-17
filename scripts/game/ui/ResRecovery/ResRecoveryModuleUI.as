package game.ui.ResRecovery
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS11UI;
   
   public class ResRecoveryModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="904" height="590">
			  <Image skin="png.uiResRecovery.0003_二级框底部光-副本" x="0" y="0"/>
			  <Image skin="png.uiResRecovery.0002_曲线-1" x="-222" y="48"/>
			  <List x="208.5" y="219" repeatX="6" repeatY="2" spaceX="1" spaceY="1" var="rewardList">
			    <ResRecoveryItemRender x="0" y="0" name="render" runtime="game.ui.ResRecovery.ResRecoveryItemRenderUI"/>
			  </List>
			  <Label text="\l999000745" autoSize="none" x="153.5" y="136" style="普通说明" width="607" var="decTxt" multiline="true" wordWrap="true" leading="5" isHtml="true" height="67"/>
			  <Button label="\l999000744" x="397.5" style="按钮大绿" y="536" var="openBtn"/>
			  <WealthRenderS11 x="431.5" y="431" var="chestItem" runtime="game.ui.commons.icons.WealthRenderS11UI"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="92" stateNum="1" var="closeBtn" x="838"/>
			</PopModuleView>;
       
      
      public var rewardList:List = null;
      
      public var decTxt:Label = null;
      
      public var openBtn:Button = null;
      
      public var chestItem:WealthRenderS11UI = null;
      
      public var closeBtn:Button = null;
      
      public function ResRecoveryModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.ResRecovery.ResRecoveryItemRenderUI"] = ResRecoveryItemRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS11UI"] = WealthRenderS11UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
