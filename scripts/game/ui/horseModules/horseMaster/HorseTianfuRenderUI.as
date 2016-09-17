package game.ui.horseModules.horseMaster
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class HorseTianfuRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="337" height="18">
			  <Label text="1阶激活：[进击1]" bold="false" stroke="0x0" var="txt_name" y="1" align="left" style="重要提示绿" x="17"/>
			  <Image skin="png.a5.commonImgs.img_dot" x="3" y="4"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function HorseTianfuRenderUI()
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
