package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RedPointNumUI extends View
   {
      
      protected static var uiView:XML = <View width="22" height="22">
			  <Image skin="png.a5.commonImgs.img_redPointBig" var="img_icon" x="0" y="0"/>
			  <Label text="1" autoSize="none" x="-8" y="6" align="center" height="18" var="txt_count" width="38" style="普通说明" size="12" font="SimHei"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_count:Label = null;
      
      public function RedPointNumUI()
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
