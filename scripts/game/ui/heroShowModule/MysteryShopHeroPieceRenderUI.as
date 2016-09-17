package game.ui.heroShowModule
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class MysteryShopHeroPieceRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="143" height="135">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" sizeGrid="4,4,4,4" width="143" height="135" var="img_bg"/>
			  <Image skin="png.uiHeroShow.img_mask"/>
			  <Box var="box1">
			    <Image skin="png.a5.comps.img_block" var="img_icon" width="143" height="135" autoSize="true"/>
			    <Image skin="png.uiHeroShow.img_bg_001" x="2" y="0" width="122" height="16"/>
			    <Image skin="png.a5.comps.img_block" autoSize="false" height="135" var="img_quality" width="143"/>
			    <Image skin="png.uiHeroShow.img_mask" var="img_mask"/>
			    <Label text="普罗米修斯" x="0" y="97" width="143" height="24" var="txt_name" style="随品质变化" align="center"/>
			    <Image skin="png.a5.comps.img_block" x="19" y="133" anchorX="0.5" anchorY="1" autoSize="true" width="22" height="22" var="img_career"/>
			    <Label text="碎片: 99/999" autoSize="none" y="1" style="重要提示橘黄" width="143" size="10" align="left" var="txt_num" height="18" x="3"/>
			    <Label text="普罗米修斯" x="0" y="114" width="143" height="24" var="txt_nick" style="随品质变化" align="center"/>
			    <Label text="碎片数量" x="-2" y="80" width="143" height="24" var="txt_shard_num" align="right"/>
			    <Label text="价格" x="2" width="143" height="24" var="txt_price" align="left" multiline="true" wordWrap="true" y="80"/>
			    <Label text="价格" x="2" width="143" height="24" var="txt_price1" align="left" multiline="true" wordWrap="true" y="62"/>
			  </Box>
			  <Button label="获取碎片" x="27" y="51" style="按钮中绿" var="btn_getPoint"/>
			</WealthRender>;
       
      
      public var img_bg:Image = null;
      
      public var box1:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_mask:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_career:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_nick:Label = null;
      
      public var txt_shard_num:Label = null;
      
      public var txt_price:Label = null;
      
      public var txt_price1:Label = null;
      
      public var btn_getPoint:Button = null;
      
      public function MysteryShopHeroPieceRenderUI()
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
