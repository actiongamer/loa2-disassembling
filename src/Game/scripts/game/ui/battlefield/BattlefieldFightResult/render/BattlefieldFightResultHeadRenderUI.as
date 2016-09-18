package game.ui.battlefield.BattlefieldFightResult.render
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   
   public class BattlefieldFightResultHeadRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="83" height="81">
			  <Image skin="png.comp.image" x="5" y="3" var="img_icon" width="73" height="73" smoothing="true"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS2_3" x="-3" y="-5" var="img_quality" width="86" height="86" sizeGrid="6,6,6,6"/>
			</PlayerRender>;
       
      
      public var img_icon:Image = null;
      
      public var img_quality:Image = null;
      
      public function BattlefieldFightResultHeadRenderUI()
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
