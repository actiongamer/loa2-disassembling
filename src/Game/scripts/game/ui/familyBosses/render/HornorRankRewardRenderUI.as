package game.ui.familyBosses.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HornorRankRewardRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="39" height="41">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="1" var="img_quality" sizeGrid="6,6,6,6" width="38" height="38" smoothing="true" autoSize="false"/>
			  <Image skin="png.comp.image" x="3" y="4" var="img_icon" width="32" height="32" smoothing="true"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="-15" y="21" backgroundColor="0xcfbeaf" style="普通说明"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public function HornorRankRewardRenderUI()
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
