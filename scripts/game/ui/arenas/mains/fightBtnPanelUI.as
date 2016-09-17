package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Button;
   
   public class fightBtnPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="74" height="63">
			  <Button label="挑战1次" x="2" style="按钮中蓝" y="2" var="btn_fight" width="70" height="26"/>
			  <Button label="挑战5次" x="2" y="37" style="按钮中黄" var="btn_fight5" width="70" height="26"/>
			</View>;
       
      
      public var btn_fight:Button = null;
      
      public var btn_fight5:Button = null;
      
      public function fightBtnPanelUI()
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
