package game.ui.teamPKCS.finalMatch
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TPKCGambleLeftRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="190" height="80">
			  <Image skin="png.uiTeamPKCS.final.img_blue" x="65" y="52"/>
			  <Image skin="png.uiTeamPKCS.final.img_blue" x="65" y="26"/>
			  <Image skin="png.uiTeamPKCS.final.img_blue" x="65" y="1"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="0" y="7" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="10" var="img_icon" width="56" height="56"/>
			  <Label text="这天台的月光" autoSize="none" x="75" y="4" style="下划线黄色" var="txt_name"/>
			  <Label text="战力：9999万" autoSize="none" x="75" y="29" style="普通说明" var="txt_fightValue"/>
			  <Label text="出场顺序：2" autoSize="none" x="75" y="55" style="普通说明" var="txt_order"/>
			  <Image skin="png.a5.commonImgs.img_crown" x="-12" y="0" var="img_leadercrown"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_order:Label = null;
      
      public var img_leadercrown:Image = null;
      
      public function TPKCGambleLeftRenderUI()
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
