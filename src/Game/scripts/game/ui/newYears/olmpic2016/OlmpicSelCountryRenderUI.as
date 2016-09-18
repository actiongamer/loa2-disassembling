package game.ui.newYears.olmpic2016
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class OlmpicSelCountryRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="80" height="80">
			  <Label text="普通说明" autoSize="none" x="-10" y="63" style="普通说明" var="txt_name" width="100" height="20" align="center"/>
			  <Image x="0" y="0" width="80" height="59" var="img_flag"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-4" y="-4" width="88" height="68" sizeGrid="8,8,8,8" var="selectBoxAll" name="selectBoxAll"/>
			  <Image skin="png.a5.commonImgs.勾选框-对勾" x="42" y="29" var="img_current"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var img_flag:Image = null;
      
      public var selectBoxAll:Image = null;
      
      public var img_current:Image = null;
      
      public function OlmpicSelCountryRenderUI()
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
