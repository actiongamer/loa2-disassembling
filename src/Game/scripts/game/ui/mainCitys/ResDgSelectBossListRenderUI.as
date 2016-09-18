package game.ui.mainCitys
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ResDgSelectBossListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="182" height="55">
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_render_bg" x="0" y="0" name="renderBg"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_render_select0" x="0" y="0" name="selectBox0"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_render_select1" x="0" y="0" name="selectBox1"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_icon_bg" x="6" y="6" width="44" height="44"/>
			  <Image skin="png.comp.image" x="10" y="10" width="36" height="36" var="img_icon"/>
			  <Label text="label" autoSize="left" x="53" y="3" color="0xc2beaf" size="12" var="txt_name" width="297" height="18"/>
			  <Label text="label" autoSize="left" x="53" y="34" color="0xc2beaf" size="12" var="txt_des" width="297" height="18" multiline="true" wordWrap="true"/>
			  <Label text="需要等级: 1/1" autoSize="left" x="53" y="18" color="0xff3300" size="12" width="133" height="19" multiline="true" wordWrap="true" var="txt_levelLimite"/>
			  <Image skin="png.uiMainCitys.resDgSelectBosses.img_lock" x="33" y="27" var="img_lock"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_des:Label = null;
      
      public var txt_levelLimite:Label = null;
      
      public var img_lock:Image = null;
      
      public function ResDgSelectBossListRenderUI()
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
