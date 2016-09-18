package game.ui.BagModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class BagItemRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="64" height="64">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="0" var="img_quality" y="0" sizeGrid="8,8,8,8" width="64" height="64"/>
			  <Image skin="png.a5.comps.img_block" x="4" y="4" width="56" height="56" var="img_icon"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="46" align="right" x="14" y="44" style="普通说明"/>
			  <List y="46" repeatX="5" spaceX="-10" var="list_stars" scale="0.34" x="1">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_star_cnt" width="46" align="left" x="36" y="45" style="普通说明"/>
			  <Label text="New" stroke="0xffffff" mouseEnabled="false" width="72" align="center" x="-25" y="-6" style="渐变绿" height="20" size="14" var="img_new"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public var img_new:Label = null;
      
      public function BagItemRenderUI()
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
