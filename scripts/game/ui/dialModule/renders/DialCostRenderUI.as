package game.ui.dialModule.renders
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DialCostRenderUI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="77" height="25">
			  <Image skin="png.a5.comps.img_block" x="13" y="13" anchorX="0.5" anchorY="0.5" autoSize="true" scale="0.4" width="64" height="64" var="img_icon"/>
			  <Label text="x88888" autoSize="left" x="28" y="5" size="12" var="txt_needNum" letterSpacing="1" style="随品质变化" buttonMode="true" width="77"/>
			</LotteryRender>;
       
      
      public var img_icon:Image = null;
      
      public var txt_needNum:Label = null;
      
      public function DialCostRenderUI()
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
