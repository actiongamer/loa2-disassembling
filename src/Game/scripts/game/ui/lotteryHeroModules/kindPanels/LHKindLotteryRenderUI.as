package game.ui.lotteryHeroModules.kindPanels
{
   import morn.customs.components.LotteryRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class LHKindLotteryRenderUI extends LotteryRender
   {
      
      protected static var uiView:XML = <LotteryRender width="126" height="39">
			  <Label text="label" x="36" y="10.5" width="86" var="txt_num" height="18" align="left" style="内容数字" autoSize="none"/>
			  <Image skin="png.a5.comps.img_block" x="13" y="10" var="img_icon" width="20" height="20"/>
			</LotteryRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_icon:Image = null;
      
      public function LHKindLotteryRenderUI()
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
