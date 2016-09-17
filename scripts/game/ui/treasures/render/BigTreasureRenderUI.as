package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class BigTreasureRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="50" showMultipleSign="false">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="64" height="64" smoothing="true"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="58" height="58" smoothing="true"/>
			  <List y="45" repeatX="5" spaceX="-10" var="list_stars" scale="0.34" x="2">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="48" y="45" style="普通说明" var="txt_star_cnt" text="x8"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function BigTreasureRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
