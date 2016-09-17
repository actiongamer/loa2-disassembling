package game.ui.battlefield.BattlefieldScene.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldCryInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="138" height="39">
			  <Image skin="png.a5.comps.img_block" x="0" y="0" width="32" height="32" var="img_res"/>
			  <Label text="10/10" autoSize="none" x="34" y="0" style="下划线黄色" width="104" align="center" var="txt_resName"/>
			  <Label text="10/10" autoSize="none" x="34" y="17" style="下划线黄色" width="104" align="center" var="txt_resStatus"/>
			</View>;
       
      
      public var img_res:Image = null;
      
      public var txt_resName:Label = null;
      
      public var txt_resStatus:Label = null;
      
      public function BattlefieldCryInfoRenderUI()
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
