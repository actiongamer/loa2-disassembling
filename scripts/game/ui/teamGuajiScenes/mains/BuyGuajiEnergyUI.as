package game.ui.teamGuajiScenes.mains
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS10UI;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class BuyGuajiEnergyUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="300" height="170">
			  <Label text="选择购买精力的数量(每份10点,每日限20份)" autoSize="none" x="27" y="41" style="普通说明" size="15" var="txt_tip" width="315" height="46" multiline="true" wordWrap="true"/>
			  <Label text="购买份数" autoSize="none" x="9" y="99" style="重要提示黄" width="116" height="26" size="15" align="right"/>
			  <Label text="可获得10点精力,花费" autoSize="none" x="-30" y="147" style="重要提示黄" width="258" height="26" size="15" var="txt_get" align="right"/>
			  <WealthRenderS10 x="232" y="145" var="wealth_diamond" runtime="game.ui.commons.icons.WealthRenderS10UI"/>
			  <Label text="(10/20)" autoSize="none" x="284" y="99" style="重要提示绿" var="txt_buyCnt"/>
			  <NumBarS1 x="130" y="97" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			</AlertContent>;
       
      
      public var txt_tip:Label = null;
      
      public var txt_get:Label = null;
      
      public var wealth_diamond:WealthRenderS10UI = null;
      
      public var txt_buyCnt:Label = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public function BuyGuajiEnergyUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS10UI"] = WealthRenderS10UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
