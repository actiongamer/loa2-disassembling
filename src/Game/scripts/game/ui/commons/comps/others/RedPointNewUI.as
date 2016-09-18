package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RedPointNewUI extends View
   {
      
      protected static var uiView:XML = <View width="37" height="21" mouseChildren="false" mouseEnabled="false">
			  <Image skin="png.a5.commonImgs.img_hotBack" x="0" y="0" var="imgHot" scaleX="0.8" scaleY="0.8" smoothing="true"/>
			  <Image skin="png.a5.commonImgs.img_newBack" x="0" y="0" var="imgNew" scaleX="0.8" scaleY="0.8" smoothing="true"/>
			  <Label text="New" autoSize="none" x="-2" y="0" align="center" height="17" var="txt" width="34" font="SimSun" color="0xfff227" labelFilterKind="无" bold="false" size="12"/>
			</View>;
       
      
      public var imgHot:Image = null;
      
      public var imgNew:Image = null;
      
      public var txt:Label = null;
      
      public function RedPointNewUI()
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
