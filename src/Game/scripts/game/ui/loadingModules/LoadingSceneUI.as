package game.ui.loadingModules
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   
   public class LoadingSceneUI extends View
   {
      
      protected static var uiView:XML = <View width="1500" height="900">
			  <GRect radius="0,0,0,0" lineAlpha="0" fillColor="0x0" right="0" bottom="0" left="0" top="0" fillAlpha="1" var="gBg"/>
			  <Label text="tools用的假loading" autoSize="none" x="530.5" y="416" style="普通说明" size="48"/>
			  <Label text="100%" autoSize="none" x="241.5" y="496" style="普通绿色" size="36" var="txt_process" width="1017" height="58" align="center"/>
			</View>;
       
      
      public var gBg:GRect = null;
      
      public var txt_process:Label = null;
      
      public function LoadingSceneUI()
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
