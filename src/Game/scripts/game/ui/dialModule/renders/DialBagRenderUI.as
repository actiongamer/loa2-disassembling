package game.ui.dialModule.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DialBagRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="-1" y="-1" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="2" y="2" var="img_icon" width="56" height="56"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="5" y="42" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <Label text="强力英雄碎片大礼包" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="center" y="59" backgroundColor="0xcfbeaf" color="0xffffff" height="41" mouseChildren="false" x="-17.5" width="95" multiline="true" wordWrap="true"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_name:Label = null;
      
      public function DialBagRenderUI()
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
