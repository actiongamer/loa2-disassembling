package game.ui.abilityRankModule.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class AbilityRewardRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="36" height="35">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="-1" var="img_quality" sizeGrid="6,6,6,6" width="36" height="36"/>
			  <Image skin="png.comp.image" x="3" y="2" var="img_icon" width="30" height="30"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="-19" y="18" backgroundColor="0xcfbeaf" style="普通说明" size="10"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function AbilityRewardRenderUI()
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
