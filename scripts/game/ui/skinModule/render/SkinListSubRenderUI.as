package game.ui.skinModule.render
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.VBox;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.Button;
   import game.ui.fashionModules.FashionSuitSkillRenderUI;
   
   public class SkinListSubRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="117">
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" width="207" height="117" var="img_mask"/>
			  <Image skin="png.uiSkinMain.img_listRenderBg2" x="0" y="-1" sizeGrid="3,10,3,20" var="img_bg"/>
			  <Box x="19" y="12" var="box_info">
			    <Label text="天女散花" autoSize="left" style="重要提示橘黄" size="13" var="txt_name" x="56" y="0" width="123" height="20" align="center"/>
			    <Label text="\l30200000" autoSize="left" y="33" width="109" height="24" style="重要提示橘黄" size="13" x="69" var="txt_desc"/>
			    <List x="54" y="56" repeatY="2" var="list_skill">
			      <FashionSuitSkillRender name="render" runtime="game.ui.fashionModules.FashionSuitSkillRenderUI"/>
			    </List>
			    <SkinRender var="skinRender" y="10" runtime="game.ui.skinModule.render.SkinRenderUI"/>
			    <Label text="\l999900505" autoSize="left" style="重要提示绿" size="13" var="txt_clickTips" x="-14" y="66" width="87" height="44" align="center" multiline="true" wordWrap="true"/>
			  </Box>
			  <VBox x="0" y="127" width="207" var="box">
			    <Box x="8" y="3" centerX="0">
			      <Image skin="png.a5.commonImgs.img_fightPowerBg"/>
			      <FightValueBox var="box_fight" x="35" y="4" runtime="game.ui.commons.props.FightValueBoxUI"/>
			    </Box>
			  </VBox>
			  <Button x="3" y="83" width="203" height="33" var="img_extend" buttonMode="true" mouseChildren="false"/>
			</View>;
       
      
      public var img_mask:GRect = null;
      
      public var img_bg:Image = null;
      
      public var box_info:Box = null;
      
      public var txt_name:Label = null;
      
      public var txt_desc:Label = null;
      
      public var list_skill:List = null;
      
      public var skinRender:game.ui.skinModule.render.SkinRenderUI = null;
      
      public var txt_clickTips:Label = null;
      
      public var box:VBox = null;
      
      public var box_fight:FightValueBoxUI = null;
      
      public var img_extend:Button = null;
      
      public function SkinListSubRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         viewClassMap["game.ui.fashionModules.FashionSuitSkillRenderUI"] = FashionSuitSkillRenderUI;
         viewClassMap["game.ui.skinModule.render.SkinRenderUI"] = game.ui.skinModule.render.SkinRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
