package game.ui.commons.icons
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class LotteryRenderS6UI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="77" height="25">
			  <Image skin="png.a5.comps.img_block" x="13" y="12" anchorX="0.5" anchorY="0.5" autoSize="true" scale="0.4" width="64" height="64" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="28" y="4" size="12" var="txt_countAndNeed" letterSpacing="1" style="随品质变化" buttonMode="true"/>
			</LotteryRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_countAndNeed:Label = null;
      
      public function LotteryRenderS6UI()
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
