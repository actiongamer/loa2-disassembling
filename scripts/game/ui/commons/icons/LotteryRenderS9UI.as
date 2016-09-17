package game.ui.commons.icons
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class LotteryRenderS9UI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="78" height="22">
			  <Image skin="png.a5.comps.img_block" x="11" y="11" anchorX="0.5" anchorY="0.5" autoSize="false" width="22" height="22" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="26" y="3" size="12" var="txt_needNum" letterSpacing="1" style="随品质变化" buttonMode="true"/>
			</LotteryRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_needNum:Label = null;
      
      public function LotteryRenderS9UI()
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
