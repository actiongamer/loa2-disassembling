package game.ui.horseModules.horseMaster
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class HorseMasterLvLabelUI extends View
   {
      
      protected static var uiView:XML = <View width="100" height="18" style="小标题">
			  <Label text="Lv.1" stroke="0xffffff" mouseEnabled="false" var="txt_lv" backgroundColor="0xcfbeaf" x="1" y="0" letterSpacing="1" width="100" height="18" align="center" style="普通说明"/>
			</View>;
       
      
      public var txt_lv:Label = null;
      
      public function HorseMasterLvLabelUI()
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
