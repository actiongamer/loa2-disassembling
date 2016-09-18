package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class RoleEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="56" height="56" mouseEnabled="false">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" var="img_quality" width="62" height="62" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.commonImgs.img_equipRenderBg4" x="31" y="30" anchorX=".5" anchorY=".5" var="img_bg"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="56" height="56"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="52" y="-3" var="img_redPoint" visible="false" mouseEnabled="false"/>
			  <Label text="四字装备" color="0xeac472" var="txt_name" mouseEnabled="false" mouseChildren="false" x="5" y="66" centerX="3"/>
			  <Label style="普通说明" var="label_jinglian" text="haha" x="62" y="68"/>
			  <Box x="-2" y="-3" var="box_lvl">
			    <Image skin="png.a5.bgs.iconBgs.img_EquiplvlBg_1" x="4" y="5" var="img_lvlBg"/>
			    <Label text="22" autoSize="none" color="0xffe0a3" labelFilterKind="106" size="10" width="25" height="18" align="center" font="Microsoft YaHei" var="txt_lvl" bold="false"/>
			  </Box>
			  <List y="46" repeatX="5" spaceX="-10" var="list_stars" scale="0.34" x="1">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="51" y="45" style="普通说明" var="txt_star_cnt" text="x8"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_redPoint:Image = null;
      
      public var txt_name:Label = null;
      
      public var label_jinglian:Label = null;
      
      public var box_lvl:Box = null;
      
      public var img_lvlBg:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function RoleEquipRenderUI()
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
