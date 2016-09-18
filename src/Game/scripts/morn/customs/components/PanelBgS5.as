package morn.customs.components
{
   public class PanelBgS5 extends PanelBg implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="523" height="294">
				<Image layer="6" var="bgCustom" x="10" y="10" compId="1"/>
  				<Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" layer="6" left="5" right="5" bottom="10" var="img_rimBg" sizeGrid="44,32,44,32" x="10" y="19" width="511" height="276" top="10" compId="2"/>
  				<Image skin="png.a5.bgs.panelBgs.raw.面板分割线" x="17" y="74" layer="6" var="img_tabLine" left="4" right="4" compId="3"/>
  				<Image layer="5" var="bgCustom" compId="10"/>
  				<Image skin="png.a5.bgs.panelBgs.raw.底板一级框S5" layer="1" var="img_rim" sizeGrid="66,134,66,58" x="-13" y="-8" width="519" height="294" left="-13" top="-8" bottom="0" right="-16" compId="4"/>
  				<Image layer="3" var="img_titleName" y="15" anchorY="0.5" autoSize="true" centerX="0" x="204.5" compId="5"/>
  				<GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" x="0" y="1" layer="4" height="12" var="gDrag" left="0" right="0" width="523" compId="6"/>
  				<Label text="标题" autoSize="none" styleSkin="png.comp.label" y="14" layer="4" style="标题普通" centerX="0" width="163" height="22" mouseEnabled="false" align="center" var="txt_titleName" x="163.5" compId="7"/>
				<Button skin="png.a5.btns.btn_closeS1" y="0" layer="2" stateNum="1" right="6" var="btn_close" x="457" compId="9"/>
			</View>;
       
      
      public function PanelBgS5()
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
