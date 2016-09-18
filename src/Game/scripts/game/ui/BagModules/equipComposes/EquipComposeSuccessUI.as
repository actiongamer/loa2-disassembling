package game.ui.BagModules.equipComposes
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.ClickToNextUI;
   
   public class EquipComposeSuccessUI extends View
   {
      
      protected static var uiView:XML = <View width="2000" height="1000" var="img_bg">
			  <GRect fillAlpha="0.4" radius="0,0,0,0" lineAlpha="0" width="2000" height="1000" lineColor="0x0" fillColor="0x0" var="img_cover"/>
			  <Box x="786.5" y="407" var="box_bg">
			    <PanelBgS4 btnCloseStyle="2" y="0" x="0"/>
			    <Label text="重要提示橘黄" autoSize="none" x="67" y="152" style="重要提示橘黄" width="290" height="22" align="center" var="txt_prompt"/>
			    <Label text="合成成功" autoSize="none" x="68" y="21" style="二级框标题" width="290" height="28" align="center" var="txt_title"/>
			  </Box>
			  <EquipComposeRenderSuccess x="972.5" y="473" var="render" runtime="game.ui.BagModules.equipComposes.EquipComposeRenderSuccessUI"/>
			  <ClickToNext x="924.5" y="600" var="box_clickNext" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			</View>;
       
      
      public var img_bg:View = null;
      
      public var img_cover:GRect = null;
      
      public var box_bg:Box = null;
      
      public var txt_prompt:Label = null;
      
      public var txt_title:Label = null;
      
      public var render:game.ui.BagModules.equipComposes.EquipComposeRenderSuccessUI = null;
      
      public var box_clickNext:ClickToNextUI = null;
      
      public function EquipComposeSuccessUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.equipComposes.EquipComposeRenderSuccessUI"] = game.ui.BagModules.equipComposes.EquipComposeRenderSuccessUI;
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
