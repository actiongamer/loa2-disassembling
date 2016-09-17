package game.ui.roleInfos.equipPanels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class RoleSelectPetRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="50" height="50">
			  <Image skin="png.a5.icons.角色-装备占位框"/>
			  <Image x="0" y="0" var="img_quality" skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" width="50" height="50"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="四字装备" autoSize="none" x="-73" y="55" color="0xeac472" width="198" height="18" align="center" var="txt_name"/>
			  <Box x="-3" y="-2" var="box_lvl">
			    <Image skin="png.a5.bgs.iconBgs.img_EquiplvlBg_1" x="5" y="4" var="img_lvlBg"/>
			    <Label text="12" autoSize="none" color="0xffe0a3" labelFilterKind="106" size="10" width="25" height="18" align="center" font="Microsoft YaHei" var="txt_lvl" bold="false" x="0" y="-1"/>
			  </Box>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var box_lvl:Box = null;
      
      public var img_lvlBg:Image = null;
      
      public var txt_lvl:Label = null;
      
      public function RoleSelectPetRenderUI()
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
