package morn.customs.components
{
   public class PanelBgS7 extends PanelBg implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="600" height="461" sceneColor="0xffffff" layers="3,1,0,0,btnClose;6,1,0,0,gRect;5,1,0,0,titleName;1,1,0,0,img_rimBg" compId="6">
			  <Image skin="png.a5.comps.img_block" layer="1" smoothing="true" var="img_rimBg" left="-210" right="-138" top="-52" bottom="-14" compId="1"/>
			  <Image layer="5" var="img_titleName" y="13" anchorY="0.5" autoSize="true" centerX="0" x="259.5" compId="2"/>
			  <Label text="标题" autoSize="none" styleSkin="png.comp.label" y="4" layer="6" style="二级框标题" centerX="0" width="163" height="22" mouseEnabled="false" align="center" var="txt_titleName" x="218.5" compId="3"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" x="0" y="0" layer="6" height="30" var="gDrag" width="600" left="0" right="0" compId="4"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="-4" layer="3" stateNum="1" var="btn_close" x="584" compId="5"/>
			</View>;
       
      
      public function PanelBgS7()
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
