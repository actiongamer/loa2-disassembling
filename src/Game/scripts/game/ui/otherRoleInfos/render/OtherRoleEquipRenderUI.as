package game.ui.otherRoleInfos.render
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class OtherRoleEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" var="img_quality" width="56" height="56" sizeGrid="8,8,8,8" x="0" y="0"/>
			  <Image skin="png.a5.commonImgs.img_equipRenderBg1" x="27" y="28" anchorX=".5" anchorY=".5" var="img_bg"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  <Box x="-3" y="-2" var="box_lvl">
			    <Image skin="png.a5.bgs.iconBgs.img_EquiplvlBg_1" x="5" y="4" var="img_lvlBg"/>
			    <Label text="12" autoSize="none" color="0xffe0a3" labelFilterKind="106" size="10" width="25" height="18" align="center" font="Arial" var="txt_lvl" bold="false"/>
			  </Box>
			  <List y="42" repeatX="5" spaceX="-10" var="list_stars" scale="0.3" x="1">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="51" y="45" style="普通说明" var="txt_star_cnt" text="x8"/>
			  <Label text="四字装备" color="0xeac472" var="txt_name" mouseEnabled="false" mouseChildren="false" x="5" y="61" centerX="3"/>
			  <Label style="普通说明" var="label_jinglian" text="haha" x="64" y="63"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var box_lvl:Box = null;
      
      public var img_lvlBg:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public var txt_name:Label = null;
      
      public var label_jinglian:Label = null;
      
      public function OtherRoleEquipRenderUI()
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
