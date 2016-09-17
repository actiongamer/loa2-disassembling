package game.ui.tooltipModules.comps
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.Panel;
   import morn.core.components.VBox;
   import morn.core.components.Button;
   
   public class SpToolTipHeroInfoDetailUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="336" height="400">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tooltipBgS1_3" sizeGrid="260,220,20,20" var="img_bg" top="0" bottom="0" width="336" x="0" y="0"/>
			  <Panel x="3" y="125" width="325" var="panel" height="267" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S2">
			    <VBox x="0" y="5" width="310" var="box"/>
			  </Panel>
			  <VBox x="3" y="5" width="310" var="boxTitle"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" x="299" y="10" var="btn_close"/>
			  <Button skin="png.a5.btns.btn_longBar" x="297" y="45" var="btnRight"/>
			  <Button skin="png.a5.btns.btn_longBar" x="40" y="45" scaleX="-1" var="btnLeft"/>
			</FadeView>;
       
      
      public var img_bg:Image = null;
      
      public var panel:Panel = null;
      
      public var box:VBox = null;
      
      public var boxTitle:VBox = null;
      
      public var btn_close:Button = null;
      
      public var btnRight:Button = null;
      
      public var btnLeft:Button = null;
      
      public function SpToolTipHeroInfoDetailUI()
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
