package game.ui.busyActivity.dragonBoats.funnys
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class DragonBoatFunnyProductRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="64" height="70">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS7_7" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="64" height="64"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="58" height="58"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="7" y="43" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="79" align="center" x="-7.5" y="-22" backgroundColor="0xcfbeaf" color="0xffffff" height="20"/>
			  <RedPoint x="54" y="-2" var="redPoiUI" runtime="game.ui.commons.comps.others.RedPointUI"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var txt_name:Label = null;
      
      public var redPoiUI:RedPointUI = null;
      
      public function DragonBoatFunnyProductRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
