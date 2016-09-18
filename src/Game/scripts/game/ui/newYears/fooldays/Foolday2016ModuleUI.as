package game.ui.newYears.fooldays
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class Foolday2016ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="770" height="540">
			  <Image skin="png.uiFoolday.img_bg2" x="-274" y="-65"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="10" x="738" var="btn_close"/>
			  <Foolday2016ShopPanel x="-364" y="-87" var="shopPanel" runtime="game.ui.newYears.fooldays.Foolday2016ShopPanelUI"/>
			  <Label text="title" autoSize="none" x="112" style="渐变1" width="440" height="43" bold="true" leading="-1" var="txt_title" multiline="true" wordWrap="true" y="-13" size="28" align="center"/>
			</PopModuleView>;
       
      
      public var btn_close:Button = null;
      
      public var shopPanel:game.ui.newYears.fooldays.Foolday2016ShopPanelUI = null;
      
      public var txt_title:Label = null;
      
      public function Foolday2016ModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.fooldays.Foolday2016ShopPanelUI"] = game.ui.newYears.fooldays.Foolday2016ShopPanelUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
