package game.ui.battleResults
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class BattleDropsNameRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="77" height="23">
			  <Label autoSize="left" color="0xFFE0A3" stroke="0x333333" size="12" bold="false" width="77" height="21" x="1" y="0" text="神奇的药水啊" align="center" var="txt_name"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function BattleDropsNameRenderUI()
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
