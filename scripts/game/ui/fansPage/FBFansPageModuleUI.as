package game.ui.fansPage
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS11UI;
   
   public class FBFansPageModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="550" height="370">
			  <Image skin="png.uiFBFansPage.FB底 " x="-194" y="-95"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="-1" stateNum="1" var="closeBtn" x="505"/>
			  <Label text="\l999001124" autoSize="none" x="48" y="12" style="渐变2" width="454" height="20" align="center" var="titleTxt"/>
			  <List x="222.5" y="226" repeatX="2" centerX="0" spaceX="25" var="rewardList">
			    <WealthRenderS11 name="render" runtime="game.ui.commons.icons.WealthRenderS11UI"/>
			  </List>
			  <Button label="\l999001125" x="204.5" style="按钮大黄充值" y="305" centerX="0" var="likeBtn"/>
			  <Label text="\l350010011" autoSize="none" x="171" y="59" style="小标题" width="335" align="left" multiline="true" wordWrap="true" size="25" bold="true" height="70"/>
			  <Label text="\l350010012" autoSize="none" x="107.5" y="168" style="小标题" width="335" align="center" multiline="true" wordWrap="true" height="47" size="16" bold="true"/>
			</PopModuleView>;
       
      
      public var closeBtn:Button = null;
      
      public var titleTxt:Label = null;
      
      public var rewardList:List = null;
      
      public var likeBtn:Button = null;
      
      public function FBFansPageModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS11UI"] = WealthRenderS11UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
