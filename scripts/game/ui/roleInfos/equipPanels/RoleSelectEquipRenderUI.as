package game.ui.roleInfos.equipPanels
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class RoleSelectEquipRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="50" height="50">
			  <Image skin="png.a5.icons.角色-装备占位框"/>
			  <Image x="0" y="0" var="img_quality" skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" width="50" height="50"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="四字装备" autoSize="none" x="-73" y="55" color="0xeac472" width="198" height="18" align="center" var="txt_name"/>
			  <Image skin="png.a5.commonImgs.推荐" x="26" y="-18" var="img_arrow"/>
			  <Image skin="png.a5.commonImgs.盟约" x="27" y="-19" var="img_mengyue" visible="false"/>
			  <Box x="-3" y="-2" var="box_lvl">
			    <Image skin="png.a5.bgs.iconBgs.img_EquiplvlBg_1" x="5" y="4" var="img_lvlBg"/>
			    <Label text="12" autoSize="none" color="0xffe0a3" labelFilterKind="106" size="10" width="25" height="18" align="center" font="Microsoft YaHei" var="txt_lvl" bold="false" x="0" y="-1"/>
			  </Box>
			  <List y="37" repeatX="5" spaceX="-12" var="list_stars" scale="0.27" x="2">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label autoSize="none" x="30" y="34" style="普通说明" var="txt_star_cnt" text="haha"/>
			</WealthRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_arrow:Image = null;
      
      public var img_mengyue:Image = null;
      
      public var box_lvl:Box = null;
      
      public var img_lvlBg:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_star_cnt:Label = null;
      
      public function RoleSelectEquipRenderUI()
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
