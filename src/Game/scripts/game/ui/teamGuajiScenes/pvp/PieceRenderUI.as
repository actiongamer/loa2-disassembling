package game.ui.teamGuajiScenes.pvp
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class PieceRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="76" height="36" showMultipleSign="true">
			  <Label text="x999" autoSize="left" x="30" y="4" size="12" var="txt_num" letterSpacing="1" style="普通说明"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="-1" var="img_quality" sizeGrid="6,6,6,6" width="30" height="30"/>
			  <Image skin="png.comp.image" var="img_icon" x="3" y="2" width="24" height="24"/>
			</WealthRender>;
       
      
      public var txt_num:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function PieceRenderUI()
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
