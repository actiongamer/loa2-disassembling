package game.ui.salesModule.render
{
   import morn.core.components.View;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import game.ui.lotteryHeroModules.ClickToNextButtonTimeUI;
   
   public class SalesBenefitRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="475" height="93">
			  <Image skin="png.uiSales.分割线" x="0" y="69" centerX="0"/>
			  <WealthRenderS9 x="16" y="9" var="itemRender" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  <Label text="祝福石x500" autoSize="none" x="93" y="18" style="普通说明" var="label_desc"/>
			  <Button label="可领取" x="336" y="25" style="按钮大绿" stateNum="1" var="btn_canGet" language="en" lgy="25,25,25,25,0"/>
			  <Label text="购买道具人次达800人可领取" autoSize="none" x="93" y="38" style="普通说明" var="label_limit"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="358" y="-1" var="img_gotReward"/>
			  <ClickToNextButtonTime x="216" y="566" var="clickToNextButtonTimeUI" runtime="game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"/>
			  <Label autoSize="none" x="93" y="59" style="普通说明" var="yueKaTipTxt"/>
			  <Label text="\l999000585" var="yueKaTxt" width="53" height="18" align="center" style="重要提示绿" buttonMode="true" underline="true" mouseChildren="false" x="373" y="32"/>
			</View>;
       
      
      public var itemRender:WealthRenderS9UI = null;
      
      public var label_desc:Label = null;
      
      public var btn_canGet:Button = null;
      
      public var label_limit:Label = null;
      
      public var img_gotReward:Image = null;
      
      public var clickToNextButtonTimeUI:ClickToNextButtonTimeUI = null;
      
      public var yueKaTipTxt:Label = null;
      
      public var yueKaTxt:Label = null;
      
      public function SalesBenefitRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         viewClassMap["game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"] = ClickToNextButtonTimeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
