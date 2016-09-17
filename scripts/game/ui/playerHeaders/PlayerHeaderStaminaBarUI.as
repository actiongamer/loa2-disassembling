package game.ui.playerHeaders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   
   public class PlayerHeaderStaminaBarUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="146" height="16">
			  <ProgressBar skin="png.uiPlayerHeader.progress_stamina" x="0" y="0" sizeGrid="10,0,10,0" value="1" var="bar_num"/>
			  <Label text="100/100" x="13" y="-4" var="txt_value" width="120" buttonMode="true" style="普通说明" align="center" autoSize="none"/>
			</WealthRender>;
       
      
      public var bar_num:ProgressBar = null;
      
      public var txt_value:Label = null;
      
      public function PlayerHeaderStaminaBarUI()
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
