package game.ui.lotteryHeroModules.results
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class LotteryHeroResultRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="54" height="70">
			  <Image skin="png.uiCommon.bgs.img_qualityBg60_1" x="0" y="0" width="54" height="54" var="img_quality" sizeGrid="4,4,4,4"/>
			  <Image skin="png.a5.comps.img_block" x="2" y="2" height="50" width="50" var="img_icon"/>
			  <Label text="x88888" autoSize="center" x="4" y="54" size="12" color="0xffe1a2" var="txt_name" letterSpacing="1" align="center"/>
			  <Image skin="png.uiLottery.style4.新" x="42" y="-9" var="imgNew"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var imgNew:Image = null;
      
      public function LotteryHeroResultRenderUI()
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
