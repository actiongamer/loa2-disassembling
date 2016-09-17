package game.ui.BagModules.equipComposes
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class EquipComposeRenderToUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="54" height="110">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="8" var="img_quality" sizeGrid="6,6,6,6" scale="1.1" width="50" height="50"/>
			  <Image skin="png.comp.image" x="3" y="11" var="img_icon" width="45" height="45" scale="1.1"/>
			  <Label text="突破时" stroke="0xffffff" mouseEnabled="false" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="-56.5" y="67" letterSpacing="1" width="168" height="18" align="center" style="普通说明"/>
			  <Label text="8699" stroke="0xffffff" mouseEnabled="false" var="txt_num" backgroundColor="0xcfbeaf" autoSize="none" align="center" x="-0.5" y="87" width="55" height="16" style="重要提示绿"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_num:Label = null;
      
      public function EquipComposeRenderToUI()
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
