package game.ui.teamPKCS
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class TPKRedRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="394" height="79">
			  <Image skin="png.uiTeamPKCS.img_order_red" x="0" y="0"/>
			  <Label text="普通说明" autoSize="none" x="138" y="13" style="普通说明" var="txt_name" width="147" height="20" align="right"/>
			  <Label text="普通说明" autoSize="none" x="143" y="44" style="普通说明" var="txt_fightValue" width="142" height="20" align="right"/>
			  <Label text="普通说明说明" autoSize="none" x="11" y="14" style="普通说明" var="txt_order" align="right" width="93" height="20"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="323" y="13" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="326" y="16" var="img_icon" width="44" height="44"/>
			  <Label text="Lv.98" autoSize="left" x="324" y="13" width="46" height="18" var="txt_lv" style="普通说明"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_order:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public function TPKRedRenderUI()
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
