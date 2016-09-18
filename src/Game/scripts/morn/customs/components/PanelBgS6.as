package morn.customs.components
{
   public class PanelBgS6 extends PanelBg
   {
      
      protected static var uiXML:XML = <View width="721" height="121">
			  <Image skin="png.a5.bgs.panelBgs.raw.底部9宫格" sizeGrid="305,35,305,10" var="img_rimBg" left="0" right="0" top="0" bottom="0"/>
			  <Image var="bgCustom"/>
			  <Image var="img_titleName" y="18" anchorY="0.5" autoSize="true" centerX="0" x="320"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="0" y="0" height="28" var="gDrag" left="0" right="0" width="721"/>
			  <Label text="标题" autoSize="none" y="5" style="标题普通" centerX="0" width="163" height="22" mouseEnabled="false" align="center" var="txt_titleName" x="279"/>
			  <Button skin="png.a5.btns.btn_closeS5" y="-5" stateNum="1" right="26" var="btn_close" x="682"/>
			</View>;
       
      
      public function PanelBgS6()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         createView(uiXML);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.btnCloseStyle = 5;
      }
   }
}
