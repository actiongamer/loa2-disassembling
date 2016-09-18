package game.ui.roleTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class YuanFenTxtRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="119" height="18">
			  <Label text="重要提示橘黄" autoSize="left" x="2" y="0" style="普通绿色" width="117" height="18" var="txt_name"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function YuanFenTxtRenderUI()
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
