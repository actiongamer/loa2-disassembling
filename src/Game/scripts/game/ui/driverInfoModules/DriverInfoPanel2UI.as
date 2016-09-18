package game.ui.driverInfoModules
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class DriverInfoPanel2UI extends View
   {
      
      protected static var uiView:XML = <View width="679" height="407">
			  <Image skin="png.uiDriverInfoModules.di" x="4" y="0"/>
			  <Label text="\l999000632" autoSize="none" x="135" y="127" color="0xc2beaf" width="522" height="164" style="升级后加底标题" size="22"/>
			  <Button label="下载微端" buttonMode="true" labelFont="SSZH" x="252" y="280" var="btn_downMiniApp" style="按钮大黄"/>
			  <Label text="\l999000631" autoSize="none" x="21" y="28" color="0xc2beaf" width="642" height="69" style="升级后加底标题" size="22"/>
			</View>;
       
      
      public var btn_downMiniApp:Button = null;
      
      public function DriverInfoPanel2UI()
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
