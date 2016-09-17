package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   
   public class RoleBaoWuRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="47" height="47" buttonMode="true" mouseChildren="false">
			  <Image skin="png.uiRoleInfo.img_equipRenderBg4" x="24" y="24" var="img_bg" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS1_1" x="0" var="img_quality" width="48" height="48"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="42" height="42"/>
			</WealthRender>;
       
      
      public var img_bg:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function RoleBaoWuRenderUI()
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
