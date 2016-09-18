package game.ui.fashionAcc
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FashionAccRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="200" height="54">
			  <Box x="13" y="0" var="box_content">
			    <Image skin="png.uiFashion.img_subBg"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" x="5" y="4" width="47" height="47" sizeGrid="6,6,6,6" var="img_quality"/>
			    <Image skin="png.uiFashionUpgrade.打造选择界面.图标底1" x="7" y="6" var="img_icon" width="42" height="42"/>
			    <Label text="精彩活动可以获得" autoSize="none" x="56" y="3" style="普通说明" height="18" align="left" var="txt_name"/>
			    <Label text="世界\n纯净 " autoSize="none" x="55" y="19" style="普通说明" width="123" height="36" align="left" var="txt_desc" multiline="true" wordWrap="true"/>
			    <Label text="已获得" autoSize="none" x="121" y="34" style="普通绿色" height="19" align="right" var="txt_has" width="63"/>
			  </Box>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="9" y="-2" width="193" height="58" name="selectBoxAll" mouseEnabled="false" mouseChildren="false"/>
			</WealthRender>;
       
      
      public var box_content:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_desc:Label = null;
      
      public var txt_has:Label = null;
      
      public function FashionAccRenderUI()
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
