package game.ui.teamPKCS.finalMatch
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TPKCGambleRightRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="190" height="80">
			  <Image skin="png.uiTeamPKCS.final.img_red" x="12" y="50"/>
			  <Image skin="png.uiTeamPKCS.final.img_red" x="12" y="26"/>
			  <Image skin="png.uiTeamPKCS.final.img_red" x="12" y="1"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="128" y="5" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="131" y="8" var="img_icon" width="56" height="56"/>
			  <Label text="这天台的月光" autoSize="none" x="34" y="3" style="下划线黄色" var="txt_name"/>
			  <Label text="\l50500030" autoSize="none" x="34" y="29" style="普通说明" var="txt_fightValue"/>
			  <Label text="\l50800044" autoSize="none" x="34" y="53" style="普通说明" var="txt_order"/>
			  <Image skin="png.a5.commonImgs.img_crown" x="171" y="-1" var="img_leadercrown"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_order:Label = null;
      
      public var img_leadercrown:Image = null;
      
      public function TPKCGambleRightRenderUI()
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
