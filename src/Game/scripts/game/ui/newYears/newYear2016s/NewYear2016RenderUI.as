package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class NewYear2016RenderUI extends View
   {
      
      protected static var uiView:XML = <View width="256" height="498">
			  <Image skin="png.uiNewYear2016.img_item_bg1" x="0" y="0" var="img_bg"/>
			  <Image skin="png.uiNewYear2016.img_title1" x="0" y="159" var="img_title"/>
			  <Image skin="png.uiNewYear2016.img_split" x="251" y="60"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_canGet" x="0" y="116" var="redPoi"/>
			  <Box x="6" y="1" var="box_startTime">
			    <Image skin="png.a5.commonImgs.img_NameBg" x="37"/>
			    <Label text="普通说明" autoSize="none" y="1" style="普通说明" width="243" height="21" align="center" var="txt_startTime" size="14"/>
			  </Box>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_title:Image = null;
      
      public var redPoi:Image = null;
      
      public var box_startTime:Box = null;
      
      public var txt_startTime:Label = null;
      
      public function NewYear2016RenderUI()
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
