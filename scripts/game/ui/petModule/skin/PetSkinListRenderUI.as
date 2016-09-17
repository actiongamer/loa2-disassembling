package game.ui.petModule.skin
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.VBox;
   import morn.core.components.Button;
   import game.ui.petModule.comps.PetListRenderUI;
   import game.ui.fashionModules.FashionSuitSkillRenderUI;
   
   public class PetSkinListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="117">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" width="207" height="117" var="img_mask" x="0" y="1"/>
			  <Image skin="png.a5.bgs.panelBgs.底框01" x="0" y="0" sizeGrid="16,16,16,16" var="img_bg" width="207" height="117"/>
			  <Box x="17" y="9" var="box_info" width="187" height="100" mouseEnabled="false">
			    <Image skin="png.a5.commonImgs.img_yellow" x="10"/>
			    <Label text="天女散花" autoSize="left" style="重要提示橘黄" size="13" var="txt_name" x="24" y="5" width="126" height="20" align="center"/>
			    <Label text="\l30200000\n激活：护佑加成提高3%" autoSize="left" y="28" width="134" height="59" style="重要提示橘黄" x="57" var="txt_desc" multiline="true"/>
			    <List x="56" y="60" repeatY="2" var="list_skill">
			      <FashionSuitSkillRender name="render" runtime="game.ui.fashionModules.FashionSuitSkillRenderUI"/>
			    </List>
			    <PetSkinRender var="skinRender" y="24" x="2" runtime="game.ui.petModule.skin.PetSkinRenderUI"/>
			  </Box>
			  <VBox x="0" y="95" width="207" var="box"/>
			  <Button x="3" y="84" width="203" height="33" var="img_extend" buttonMode="true" mouseChildren="false"/>
			  <Box x="16" y="30" var="box_init">
			    <PetListRender buttonMode="true" scale="0.88" var="petRender" runtime="game.ui.petModule.comps.PetListRenderUI"/>
			    <Image skin="png.a5.commonImgs.勾选框-对勾" x="21" y="26" var="img_equiped" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			</View>;
       
      
      public var img_mask:GRect = null;
      
      public var img_bg:Image = null;
      
      public var box_info:Box = null;
      
      public var txt_name:Label = null;
      
      public var txt_desc:Label = null;
      
      public var list_skill:List = null;
      
      public var skinRender:game.ui.petModule.skin.PetSkinRenderUI = null;
      
      public var box:VBox = null;
      
      public var img_extend:Button = null;
      
      public var box_init:Box = null;
      
      public var petRender:PetListRenderUI = null;
      
      public var img_equiped:Image = null;
      
      public function PetSkinListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fashionModules.FashionSuitSkillRenderUI"] = FashionSuitSkillRenderUI;
         viewClassMap["game.ui.petModule.comps.PetListRenderUI"] = PetListRenderUI;
         viewClassMap["game.ui.petModule.skin.PetSkinRenderUI"] = game.ui.petModule.skin.PetSkinRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
