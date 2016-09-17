package game.ui.salesModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.salesModule.render.SalesBenefitRenderUI;
   import game.ui.salesModule.render.SalesPelopleNumRenderUI;
   
   public class SalesBenefitViewUI extends View
   {
      
      protected static var uiView:XML = <View width="724" height="416">
			  <Label text="\l999900221" autoSize="none" x="10" y="22" style="渐变1" width="208" height="388" align="center" size="16" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.comps.img_block" x="-16" y="142" width="264" height="299" var="img_icon"/>
			  <List x="223" y="11" spaceY="2" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="493" height="386" var="rewardList">
			    <SalesBenefitRender name="render" runtime="game.ui.salesModule.render.SalesBenefitRenderUI"/>
			  </List>
			  <List x="21" y="145" width="187" height="52" repeatX="5" var="list_peopleNum" spaceX="-1">
			    <SalesPelopleNumRender x="0" y="0" name="render" runtime="game.ui.salesModule.render.SalesPelopleNumRenderUI"/>
			  </List>
			  <Label text="\l60540015" autoSize="none" x="25" y="203" style="普通说明" width="178" height="90" align="left" size="16" multiline="true" wordWrap="true"/>
			  <Label text="\l999900220" autoSize="none" x="11" y="110" style="渐变1" width="211" height="35" align="center" size="26" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var rewardList:List = null;
      
      public var list_peopleNum:List = null;
      
      public function SalesBenefitViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.salesModule.render.SalesBenefitRenderUI"] = SalesBenefitRenderUI;
         viewClassMap["game.ui.salesModule.render.SalesPelopleNumRenderUI"] = SalesPelopleNumRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
