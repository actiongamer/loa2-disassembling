package game.ui.dungeonScene
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Image;
   import morn.core.components.VBox;
   import morn.core.components.Label;
   
   public class FilmSubtitleUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900">
			  <GRect fillAlpha="0.1" radius="0,0,0,0" lineAlpha="0" x="0" y="0" fillColor="0" width="1500" height="900" var="bg"/>
			  <Image skin="png.a5.bgs.panelBgs.img_propBg" x="346" y="94" var="txtBg" sizeGrid="200,50,200,50" width="784" height="440"/>
			  <VBox var="vbox" centerY="0" centerX="0">
			    <Label text="label" autoSize="left" width="815" height="90" color="0xffffff" size="36" var="txt_content" multiline="true" wordWrap="true" align="center" isHtml="true"/>
			  </VBox>
			</View>;
       
      
      public var bg:GRect = null;
      
      public var txtBg:Image = null;
      
      public var vbox:VBox = null;
      
      public var txt_content:Label = null;
      
      public function FilmSubtitleUI()
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
