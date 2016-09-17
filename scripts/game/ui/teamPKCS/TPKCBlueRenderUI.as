package game.ui.teamPKCS
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class TPKCBlueRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="394" height="79">
			  <Image skin="png.uiTeamPKCS.img_order_blue" x="0" y="0"/>
			  <Label text="普通说明" autoSize="none" x="106" y="13" style="普通说明" var="txt_name"/>
			  <Label text="普通说明" autoSize="none" x="107" y="44" style="普通说明" var="txt_fightValue"/>
			  <Label text="普通说明" autoSize="none" x="285" y="14" style="普通说明" var="txt_order"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="19" y="12" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="22" y="15" var="img_icon" width="44" height="44"/>
			  <Label text="Lv.98" autoSize="left" x="20" y="12" width="46" height="18" var="txt_lv" style="普通说明"/>
			  <Image skin="png.uiTeamPKCS.img_a_green" x="203" y="41" var="img_arrow"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_order:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_lv:Label = null;
      
      public var img_arrow:Image = null;
      
      public function TPKCBlueRenderUI()
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
