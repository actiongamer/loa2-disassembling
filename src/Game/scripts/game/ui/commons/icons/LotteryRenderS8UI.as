package game.ui.commons.icons
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class LotteryRenderS8UI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="77" height="25">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="1" y="1" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60" scale="0.4"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="13" anchorX="0.5" anchorY="0.5" autoSize="false" scale="0.4" var="img_icon" width="54" height="54"/>
			  <Label text="x88888" autoSize="left" x="28" y="5" size="12" var="txt_countAndNeed" letterSpacing="1" style="随品质变化" buttonMode="true"/>
			</LotteryRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function LotteryRenderS8UI()
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
