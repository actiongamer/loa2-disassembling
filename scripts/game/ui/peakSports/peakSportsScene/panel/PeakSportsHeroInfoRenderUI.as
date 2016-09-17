package game.ui.peakSports.peakSportsScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PeakSportsHeroInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="192" height="50">
			  <Image x="-5" y="-4" width="200" height="58" var="myImage"/>
			  <Label text="角色名称七个字" autoSize="none" x="57" y="5" style="随品质变化" var="heroNameTxt"/>
			  <Label text="战力：" autoSize="none" x="57" y="26" style="普通说明" var="powerTxt"/>
			  <Box x="0" y="0">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_5" sizeGrid="6,6,6,6"/>
			    <Image x="2" y="2" sizeGrid="6,6,6,6" width="46" height="46" var="heroImage"/>
			  </Box>
			</View>;
       
      
      public var myImage:Image = null;
      
      public var heroNameTxt:Label = null;
      
      public var powerTxt:Label = null;
      
      public var heroImage:Image = null;
      
      public function PeakSportsHeroInfoRenderUI()
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
