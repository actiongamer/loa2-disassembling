package game.ui.teamGuajiScenes.pvp.saodang
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class AutoRobResultViewUI extends View
   {
      
      protected static var uiView:XML = <View width="250" height="60">
			  <Label text="没有抢到，请继续努力哦~" autoSize="none" x="1" y="20" style="重要提示黄" width="249" height="41" align="center" var="txt_result" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var txt_result:Label = null;
      
      public function AutoRobResultViewUI()
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
