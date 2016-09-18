package game.ui.lotteryHeroModules.heroPreviews
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HeroPreviewRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="143" height="202">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" x="0" y="0" sizeGrid="4,4,4,4" width="143" height="203"/>
			  <Box y="0" var="box_info" x="0">
			    <Image skin="png.a5.comps.img_block" autoSize="true" width="143" height="202" var="img_icon"/>
			    <Image skin="png.a5.comps.img_block" autoSize="false" width="143" height="202" var="img_bg"/>
			    <Label text="普罗米修斯" x="22.5" y="165" width="99" height="24" var="txt_name" style="随品质变化" align="center"/>
			    <Image skin="png.a5.comps.img_block" autoSize="true" var="img_career" x="119" y="162" height="22" width="22" right="2"/>
			    <Label text="普罗米修斯" x="22" y="182" width="99" height="24" var="txt_name2" style="随品质变化" align="center"/>
			  </Box>
			  <Image skin="png.uiHeroShow.img_mask2" var="img_mask" width="141" height="201" x="0" y="0"/>
			</View>;
       
      
      public var box_info:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_career:Image = null;
      
      public var txt_name2:Label = null;
      
      public var img_mask:Image = null;
      
      public function HeroPreviewRenderUI()
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
