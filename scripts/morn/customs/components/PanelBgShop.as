package morn.customs.components
{
   public class PanelBgShop extends PanelBg implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="740" height="500" sceneColor="0xffffff" layers="3,1,0,1,btnClose;6,1,0,1,gRect;5,1,0,1,titleName;7,1,0,0,tilteNameBg;4,1,0,1,bgCustom;1,1,0,0,img_rimBg" compId="7">
			  <Image skin="png.a5.comps.img_block" layer="1" var="img_rimBg" top="-45" bottom="-40" left="4" x="4" y="-35" compId="1"/>
			  <Image layer="4" var="bgCustom" compId="2"/>
			  <Image layer="5" var="img_titleName" y="3" anchorY="0.5" autoSize="true" centerX="0" x="97.5" compId="3"/>
			  <Label text="标题" autoSize="none" styleSkin="png.comp.label" layer="6" style="渐变2" mouseEnabled="false" align="center" var="txt_titleName" left="0" right="0" y="3" x="0" height="18" width="276" compId="4"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" layer="6" var="gDrag" left="0" right="0" height="30" x="-2" y="-1" compId="5"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="3" layer="3" stateNum="1" right="6" var="btn_close" x="240" compId="6"/>
			</View>;
       
      
      public function PanelBgShop()
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
