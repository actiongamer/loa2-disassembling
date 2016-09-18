package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import game.ui.commons.icons.WealthRenderS19UI;
   import game.ui.commons.icons.WealthRender60X60UI;
   import morn.core.components.Label;
   
   public class CommonBuyConfirmUI extends View
   {
      
      protected static var uiView:XML = <View width="382" height="250">
			  <Label text="\l998000673" autoSize="none" x="38.5" y="42" style="普通说明" width="305" height="20" align="center"/>
			  <NumBarS1 x="123.5" y="131" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="131.5" y="154"/>
			  <WealthRenderS19 x="158" y="156" var="render_cost" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			  <Label text="\l60800039" autoSize="none" x="77" y="159" style="普通说明" width="72" height="20" align="right"/>
			  <WealthRender60X60 x="161" y="63" var="render_item" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  <Label text="VIP到6级后可以兑换2次" autoSize="none" x="41" y="178" style="不足禁止红" width="300" height="20" align="center" var="txt_alert"/>
			</View>;
       
      
      public var numBarUI:NumBarS1UI = null;
      
      public var render_cost:WealthRenderS19UI = null;
      
      public var render_item:WealthRender60X60UI = null;
      
      public var txt_alert:Label = null;
      
      public function CommonBuyConfirmUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS19UI"] = WealthRenderS19UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
