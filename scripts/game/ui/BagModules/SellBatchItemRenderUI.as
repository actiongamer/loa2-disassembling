package game.ui.BagModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   
   public class SellBatchItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="198" height="71">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="3" var="img_quality" y="0" sizeGrid="8,8,8,8" width="64" height="64"/>
			  <Image skin="png.a5.comps.img_block" x="7" y="4" width="56" height="56" var="img_icon"/>
			  <Label text="中级强化强化" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="left" autoSize="left" style="随品质变化" x="73" y="0"/>
			  <Label text="出售总价:" stroke="0xffffff" mouseEnabled="false" align="left" autoSize="left" style="普通说明" x="73" y="47" width="59" height="18.0625"/>
			  <Button skin="png.a5.btns.btn_closeS2" x="190" y="0" var="btn_remove" stateNum="1"/>
			  <Image skin="png.uiBag.线02" x="0" y="69"/>
			  <NumBarS1 x="73" y="21" var="numBarUI" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			  <SellBatchItemWealthRender x="133" y="43" var="renderSellPrice" runtime="game.ui.BagModules.SellBatchItemWealthRenderUI"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var btn_remove:Button = null;
      
      public var numBarUI:NumBarS1UI = null;
      
      public var renderSellPrice:game.ui.BagModules.SellBatchItemWealthRenderUI = null;
      
      public function SellBatchItemRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.SellBatchItemWealthRenderUI"] = game.ui.BagModules.SellBatchItemWealthRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
