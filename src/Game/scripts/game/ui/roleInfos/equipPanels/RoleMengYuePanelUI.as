package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.VBox;
   import morn.core.components.Label;
   
   public class RoleMengYuePanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="350" height="400">
			  <Image skin="png.a5.bgs.tooltipBgs.img_tipMenuBg" width="439" height="191" sizeGrid="13,13,13,13" x="-6" y="-5" var="img_bg2"/>
			  <VBox x="16" y="51" align="left" var="outVBox" space="4">
			    <Label autoSize="left"/>
			  </VBox>
			  <Image skin="png.uiRoleInfo.img_mengYueLine" x="19" y="44" width="361" var="img_line" height="1"/>
			  <Label text="\l2036" autoSize="none" x="18" y="11" style="渐变1" height="27" align="left" var="titleNameTxt" font="Microsoft YaHei" size="16" width="200"/>
			</PanelView>;
       
      
      public var img_bg2:Image = null;
      
      public var outVBox:VBox = null;
      
      public var img_line:Image = null;
      
      public var titleNameTxt:Label = null;
      
      public function RoleMengYuePanelUI()
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
