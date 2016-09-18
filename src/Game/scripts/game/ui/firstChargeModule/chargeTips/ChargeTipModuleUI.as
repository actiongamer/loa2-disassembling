package game.ui.firstChargeModule.chargeTips
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   
   public class ChargeTipModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="218" height="340">
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="-3" x="197" var="btn_close"/>
			  <CheckBox label="不再显示" x="142" y="282" selected="true" style="CheckBox普通" var="cb_again" language="en" lgx="20,142" lgy="282,282"/>
			  <Button label="按钮" y="307" style="按钮中黄" x="68" var="btn_goto"/>
			</StaticModuleView>;
       
      
      public var btn_close:Button = null;
      
      public var cb_again:CheckBox = null;
      
      public var btn_goto:Button = null;
      
      public function ChargeTipModuleUI()
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
