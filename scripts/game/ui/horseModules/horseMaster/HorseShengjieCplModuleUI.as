package game.ui.horseModules.horseMaster
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Box;
   
   public class HorseShengjieCplModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="512" height="293">
			  <PanelBgS4 x="0" y="63" width="512" height="230"/>
			  <Button label="\l10000012" style="按钮大绿" y="233" var="btn_confirm" x="202.5"/>
			  <Label text="[进击3][进击3][进击3][进击3]" stroke="0xffffff" mouseEnabled="false" var="txt_desc" backgroundColor="0xcfbeaf" autoSize="left" x="194" y="187" letterSpacing="1" width="214" align="left" style="普通绿色" wordWrap="true"/>
			  <Image skin="png.a5.commonImgs.img_shengjieSuccess" x="255" y="63" anchorX="0.5" anchorY="0.5" var="img_title"/>
			  <Image skin="png.a5.commonImgs.进阶成功-分割线" x="46.5" y="223"/>
			  <Box x="158" y="113" var="box_lvTitle">
			    <Image skin="png.uiHorse.masterInfo.img_cplBg"/>
			    <Label text="\l30300043" autoSize="none" x="28" y="2" style="普通说明" width="166" height="18" align="left" var="txt_title1"/>
			  </Box>
			  <Box x="158" y="161" var="box_activiteTitle">
			    <Image skin="png.uiHorse.masterInfo.img_cplBg"/>
			    <Label text="\l30300044" autoSize="none" x="28" y="2" style="普通说明" width="99" height="18" align="left" var="txt_title2"/>
			  </Box>
			  <Box x="197" y="138" var="box_lv">
			    <Label text="Lv.1" stroke="0xffffff" mouseEnabled="false" var="txt_lvCur" backgroundColor="0xcfbeaf" autoSize="left" y="1" letterSpacing="1" width="46" height="18" align="left" style="普通说明"/>
			    <Label text="Lv.1" stroke="0xffffff" mouseEnabled="false" var="txt_lvNext" backgroundColor="0xcfbeaf" autoSize="left" x="67" y="1" letterSpacing="1" width="46" height="18" align="left" style="普通绿色"/>
			    <Image skin="png.a5.commonImgs.img_arrowRightS3" x="36"/>
			  </Box>
			</PopModuleView>;
       
      
      public var btn_confirm:Button = null;
      
      public var txt_desc:Label = null;
      
      public var img_title:Image = null;
      
      public var box_lvTitle:Box = null;
      
      public var txt_title1:Label = null;
      
      public var box_activiteTitle:Box = null;
      
      public var txt_title2:Label = null;
      
      public var box_lv:Box = null;
      
      public var txt_lvCur:Label = null;
      
      public var txt_lvNext:Label = null;
      
      public function HorseShengjieCplModuleUI()
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
