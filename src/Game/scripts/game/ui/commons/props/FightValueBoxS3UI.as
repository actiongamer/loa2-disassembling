package game.ui.commons.props
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FightValueBoxS3UI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="45">
			  <Label text="总战力 +1000万" autoSize="none" x="0" style="渐变1" width="300" height="42" align="center" var="txt_fightValue" size="30" y="0"/>
			</View>;
       
      
      public var txt_fightValue:Label = null;
      
      public function FightValueBoxS3UI()
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
