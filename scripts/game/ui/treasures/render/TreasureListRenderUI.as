package game.ui.treasures.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class TreasureListRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="124" height="124">
			  <Box x="3" y="23" var="box_content" buttonMode="true">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" y="5" var="img_quality" sizeGrid="6,6,6,6" width="56" height="56" x="25"/>
			    <Image skin="png.comp.image" x="28" y="8" var="img_icon" width="50" height="50"/>
			    <Label text="重要提示橘黄" autoSize="none" y="66" style="重要提示橘黄" width="186" align="center" var="txt_name" x="-41" multiline="true" wordWrap="true"/>
			    <Button skin="png.a5.btns.btn_closeS4" x="61" stateNum="1" var="btn_remove"/>
			    <List y="45" repeatX="5" spaceX="-10" var="list_stars" scale="0.34" x="25">
			      <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			    </List>
			    <Label autoSize="none" x="71" y="44" style="普通说明" var="txt_star_cnt" text="x8"/>
			  </Box>
			  <Image skin="png.uiTreasure.+号" x="57" y="58" anchorX=".5" anchorY=".5" var="img_plus" buttonMode="true"/>
			</WealthRender>;
       
      
      public var box_content:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var btn_remove:Button = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public var img_plus:Image = null;
      
      public function TreasureListRenderUI()
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
