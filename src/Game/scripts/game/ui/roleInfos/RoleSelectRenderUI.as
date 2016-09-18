package game.ui.roleInfos
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RoleSelectRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="203" height="69" buttonMode="false">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgNormalS1" x="0" y="0" name="renderBg"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgOverS1" name="selectBox0"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgSelectedS1" name="selectBox1" var="img_bgSelected"/>
			  <Label text="女神一号" autoSize="left" x="67" y="17" color="0xffffff" size="12" var="txt_name" width="128" height="22"/>
			  <Label text="Lv.199" autoSize="left" x="68" y="36" color="0xffffff" size="12" var="txt_lv" width="94" height="18"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS1_4" x="9" y="10" sizeGrid="6,6,6,6" var="img_quality"/>
			  <Image skin="png.comp.image" x="12" y="13" width="44" height="44" var="img_icon"/>
			  <Image skin="png.uiRoleInfo.img_buzhenIcon" x="-3" y="-2" var="img_buzhenIcon"/>
			</View>;
       
      
      public var img_bgSelected:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_buzhenIcon:Image = null;
      
      public function RoleSelectRenderUI()
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
