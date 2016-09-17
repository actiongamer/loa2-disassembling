package game.ui.fightPlayers
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattleBuffIconUI extends View
   {
      
      protected static var uiView:XML = <View width="30" height="30">
			  <Image skin="png.comp.image" x="0" y="0" width="30" height="30" var="img_icon"/>
			  <Label text="1" autoSize="left" x="-5" y="15" var="txt_cd" align="right" width="35" height="18" color="0xffff00"/>
			  <Label text="1" autoSize="left" x="-5" y="-3" var="txt_stack" align="right" width="35" height="18" color="0xffffff"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_cd:Label = null;
      
      public var txt_stack:Label = null;
      
      public function BattleBuffIconUI()
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
