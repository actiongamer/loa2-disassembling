package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class RuneListBigRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="60" height="60" mouseChildren="false">
			  <Label text="名字" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="100" align="center" x="-20" y="57" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <Box x="2" y="-1" var="box_icon">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56"/>
			    <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  </Box>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="2" y="37" backgroundColor="0xcfbeaf" color="0xffffff"/>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public var box_icon:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function RuneListBigRenderUI()
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
