package game.ui.fashionAcc
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FashionAccMaterialRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="86" height="101">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="9" y="0" var="img_quality" sizeGrid="6,6,6,6" width="70" height="70"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.01" y="2" x="11" var="img_icon"/>
			  <Image skin="png.uiFashionUpgrade.打造界面.英雄-觉醒-文字bj" x="0" y="65" var="img_bg" width="86" height="40"/>
			  <Label text="玫瑰之心碎片" autoSize="none" y="73" style="普通说明" width="146" align="center" var="txt_name" centerX="0"/>
			  <Label text="玫瑰之心碎片" autoSize="none" x="-30" y="90" style="普通说明" width="146" align="center" var="txt_countAndNeed" centerX="0"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function FashionAccMaterialRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
