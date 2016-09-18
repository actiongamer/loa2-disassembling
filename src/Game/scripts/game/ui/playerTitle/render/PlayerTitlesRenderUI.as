package game.ui.playerTitle.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PlayerTitlesRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="194" height="44">
			  <Image skin="png.uiPlayerTitle.底框-暗" x="8" y="4"/>
			  <Image skin="png.uiPlayerTitle.底框-选中" x="0" y="0" name="selectBoxAll" visible="false"/>
			  <Label text="pageBarS2" autoSize="none" x="0" y="10" style="普通说明" width="194" height="20" align="center" var="label_title"/>
			</View>;
       
      
      public var label_title:Label = null;
      
      public function PlayerTitlesRenderUI()
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
