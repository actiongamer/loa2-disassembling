package morn.customs.components
{
   public class PanelBgMall extends PanelBg implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="900" height="599" sceneColor="0xffffff" layers="3,1,0,0,btnClose;6,1,0,0,gRect;5,1,0,0,titleName;1,1,0,0,img_rimBg" compId="7">
			  <Image skin="png.uiMall.bg" layer="1" compId="1"/>
			  <Image layer="5" var="img_titleName" y="52" anchorY="0.5" autoSize="true" centerX="0" x="411" compId="2"/>
			  <Label text="标题" autoSize="none" styleSkin="png.comp.label" y="51" layer="6" style="二级框标题" centerX="0" width="163" height="22" mouseEnabled="false" align="center" var="txt_titleName" x="370" compId="3"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" x="81" y="43" layer="6" height="30" var="gDrag" width="762" compId="4"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="55" layer="3" stateNum="1" var="btn_close" x="843" compId="5"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.面板分割线" x="42" y="104" layer="3" var="img_tabLine" width="820" compId="6"/>
			</View>
		;
       
      
      public function PanelBgMall()
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
