package game.ui.battlefield.panel
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   
   public class BattlefieldCrystalPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="800" height="480">
			  <Image skin="png.a5.comps.img_block" var="img_bg"/>
			  <Image skin="png.uiBattlefields.battlefieldCrystalPanel.img_titleBg" y="-4" centerX="0" x="254"/>
			  <Label text="\l50500002" autoSize="none" x="184.5" y="2" style="渐变1" width="425" height="35" align="center" size="23"/>
			</PanelView>;
       
      
      public var img_bg:Image = null;
      
      public function BattlefieldCrystalPanelUI()
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
