package game.ui.recycleModules.heroMirror
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class HeroHeadItemViewUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="90" height="83" buttonMode="true">
			  <Box var="itemBox" visible="false">
			    <Box x="15" y="0">
			      <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" var="img_quality" sizeGrid="6,6,6,6" width="60" height="60"/>
			      <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="54" height="54"/>
			    </Box>
			    <Label text="普通说明" autoSize="none" x="0" y="63" style="普通说明" width="90" align="center" var="txt_name"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS2" x="54" y="4" var="cleanBtn"/>
			  </Box>
			  <Image skin="png.uiRecycle.加号" x="16" y="25" var="addImage"/>
			</WealthRender>;
       
      
      public var itemBox:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var cleanBtn:Button = null;
      
      public var addImage:Image = null;
      
      public function HeroHeadItemViewUI()
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
