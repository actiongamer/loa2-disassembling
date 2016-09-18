package game.ui.dialModule.renders
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class DialMyScoreRenderUI extends View
   {
      
      protected static var uiView:XML = <View height="25" width="125">
			  <Label text="我的积分" autoSize="none" y="3" style="渐变1" width="157" height="22" align="left" size="14" var="txt_myScore" x="23"/>
			  <Image skin="png.a5.comps.img_block" x="12" y="13" anchorX="0.5" anchorY="0.5" width="22" height="22" var="img_icon"/>
			</View>;
       
      
      public var txt_myScore:Label = null;
      
      public var img_icon:Image = null;
      
      public function DialMyScoreRenderUI()
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
