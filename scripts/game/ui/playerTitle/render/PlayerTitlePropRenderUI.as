package game.ui.playerTitle.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PlayerTitlePropRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="172" height="19">
			  <HBox x="0" y="-1">
			    <Label text="敏捷：" autoSize="none" y="0" style="普通说明" width="86" height="20" var="label_prop" align="right" x="0"/>
			    <Label text="+562" autoSize="none" x="89" style="普通说明" width="86" height="20" var="label_value" align="left"/>
			  </HBox>
			</View>;
       
      
      public var label_prop:Label = null;
      
      public var label_value:Label = null;
      
      public function PlayerTitlePropRenderUI()
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
