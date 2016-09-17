package game.ui.roleTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class RoleTeamPetEquipRenderUI extends View
   {
      
      protected static var uiView:XML = <View mouseEnabled="false" width="56" height="56">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_1" var="img_quality" sizeGrid="8,8,8,8"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="50" height="50"/>
			  <Image skin="png.a5.commonImgs.img_redPoint" x="48" y="-5" var="img_redPoint" visible="false" mouseEnabled="false"/>
			  <Box x="-71" y="54" mouseEnabled="false" mouseChildren="false" centerX="0">
			    <Label text="四字装备" autoSize="none" color="0xeac472" width="198" height="18" align="center" var="txt_name" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Box x="-2" y="-3" var="box_lvl">
			    <Image skin="png.a5.bgs.iconBgs.img_EquiplvlBg_1" x="4" y="5" var="img_lvlBg"/>
			    <Label text="22" autoSize="none" color="0xffe0a3" labelFilterKind="106" size="10" width="25" height="18" align="center" font="Microsoft YaHei" var="txt_lvl" bold="false"/>
			  </Box>
			  <Image skin="png.uiRoleTeam.icon" x="4" y="2" var="img_bg"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_redPoint:Image = null;
      
      public var txt_name:Label = null;
      
      public var box_lvl:Box = null;
      
      public var img_lvlBg:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var img_bg:Image = null;
      
      public function RoleTeamPetEquipRenderUI()
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
