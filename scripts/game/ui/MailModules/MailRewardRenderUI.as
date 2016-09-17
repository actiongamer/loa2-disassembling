package game.ui.MailModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class MailRewardRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="50">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="999" color="0xcfbeaf" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="-5" y="29" backgroundColor="0xcfbeaf"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function MailRewardRenderUI()
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
