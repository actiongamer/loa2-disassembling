package game.ui.commons.props
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FightValueBoxS2UI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="21">
			  <Label text="战力 1000万" autoSize="none" x="0" y="-0.5" style="渐变1" width="200" height="22" align="center" var="txt_fightValue"/>
			</View>;
       
      
      public var txt_fightValue:Label = null;
      
      public function FightValueBoxS2UI()
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
