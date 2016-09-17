package game.ui.newYears.day38s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class Day38_ResultPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="500">
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="-10" x="800" var="btn_close"/>
			  <Image skin="png.uiDay38.img_result_1" x="22" y="311"/>
			  <Label text="渐变1" autoSize="none" x="44" y="363" style="渐变1" width="187" height="22" align="left" size="14" var="txt_tip1"/>
			  <Label text="普通说明" autoSize="none" x="44" y="455" style="普通说明" width="150" height="92" var="txt_tip3" align="left" multiline="true" wordWrap="true"/>
			  <Label text="渐变1" autoSize="none" x="44" y="433" style="渐变1" width="193" height="22" align="left" size="14" var="txt_tip2"/>
			  <Label text="爱之女神" autoSize="none" x="36" y="394" style="渐变黄" width="201" height="28" size="24" bold="true" font="Em_YaHeiB" var="txt_name"/>
			  <Label text="\l13333017" autoSize="none" x="232" y="45" style="渐变橙" width="347" height="28" size="24" bold="true" font="Em_YaHeiB" align="center" var="tt"/>
			</PopModuleView>;
       
      
      public var btn_close:Button = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_tip3:Label = null;
      
      public var txt_tip2:Label = null;
      
      public var txt_name:Label = null;
      
      public var tt:Label = null;
      
      public function Day38_ResultPanelUI()
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
