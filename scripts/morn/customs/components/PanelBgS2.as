package morn.customs.components
{
   public class PanelBgS2 extends PanelBg implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="255" height="123">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" left="6" right="6" top="31" bottom="5" var="img_rimBg" sizeGrid="44,32,44,32"/>
			  <Image var="bgCustom"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板二级框" sizeGrid="60,60,60,54" left="-5" right="-5" top="-2" var="img_rim" bottom="-2"/>
			  <Image var="img_titleName" y="17" anchorY="0.5" autoSize="true" centerX="0"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="-1" y="0" var="gDrag" left="0" right="0" height="30"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="3" stateNum="1" right="6" var="btn_close" x="662"/>
			</View>;
       
      
      public function PanelBgS2()
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
      }
   }
}
