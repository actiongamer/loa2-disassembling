package game.ui.renzhengs.vipAuths
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class RenZhengVipRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="590" height="46">
			  <Image skin="png.uiRenZhengVips.img_2" x="0" y="0"/>
			  <Label text="普通说明" autoSize="none" x="44" y="26" style="普通说明" width="546" height="20" var="txt2"/>
			  <Label text="小标题" autoSize="none" x="5" y="2" style="小标题" size="14" width="139" height="20" var="txt1"/>
			</View>;
       
      
      public var txt2:Label = null;
      
      public var txt1:Label = null;
      
      public function RenZhengVipRenderUI()
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
