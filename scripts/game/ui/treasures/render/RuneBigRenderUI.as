package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RuneBigRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62" x="0"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="6" y="43" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <Label text="名字" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="91" align="center" x="-14.5" y="66" backgroundColor="0xcfbeaf" color="0xffffff" height="22"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_name:Label = null;
      
      public function RuneBigRenderUI()
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
