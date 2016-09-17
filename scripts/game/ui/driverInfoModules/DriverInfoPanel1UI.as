package game.ui.driverInfoModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class DriverInfoPanel1UI extends View
   {
      
      protected static var uiView:XML = <View width="679" height="407">
			  <Image skin="png.uiDriverInfoModules.di_01" x="0" y="0"/>
			  <Label text="\l95400002" autoSize="left" x="126" y="376" color="0xf7d739" width="144" height="18"/>
			  <Label text="\l95400001" autoSize="left" x="33" y="339" color="0xf7d739" width="195" height="22"/>
			  <Label text="\l95400003" autoSize="left" x="310" y="376" color="0xf7d739" width="136" height="19"/>
			  <Label text="\l95400004" autoSize="left" x="488" y="376" color="0xf7d739" width="175" height="19"/>
			  <Image skin="png.uiDriverInfoModules.duigou_01" x="92" y="368"/>
			  <Image skin="png.uiDriverInfoModules.duigou_01" x="274" y="368"/>
			  <Image skin="png.uiDriverInfoModules.duigou_01" x="450" y="368"/>
			  <Label text="\l95400005" autoSize="none" x="134" y="290" color="0xf7d739" width="418" height="22" align="center" isHtml="true"/>
			  <Label text="\l95400006" autoSize="none" x="237" y="153" color="0xf7d739" width="200" height="48" align="center" multiline="true" wordWrap="true" letterSpacing="1" leading="4" isHtml="false" var="txt_tipCenter"/>
			  <Button label="\l95400007" buttonMode="true" labelFont="SSZH" x="284" y="216" var="btn_refreshBrowser" style="按钮大黄"/>
			  <Label text="driverInfo" autoSize="none" x="20" y="10" color="0xc2beaf" width="513" height="18" var="txt_driverInfoStr"/>
			  <Button label="下载微端" buttonMode="true" labelFont="SSZH" x="548" y="327" var="btn_downMiniApp" style="按钮大黄"/>
			  <Label text="\l999000633" autoSize="none" x="32" y="27" color="0xc2beaf" width="621" height="69" style="升级后加底标题" size="22"/>
			</View>;
       
      
      public var txt_tipCenter:Label = null;
      
      public var btn_refreshBrowser:Button = null;
      
      public var txt_driverInfoStr:Label = null;
      
      public var btn_downMiniApp:Button = null;
      
      public function DriverInfoPanel1UI()
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
