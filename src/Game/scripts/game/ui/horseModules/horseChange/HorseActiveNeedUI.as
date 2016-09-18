package game.ui.horseModules.horseChange
{
   import morn.core.components.View;
   import game.ui.commons.icons.SkillRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS6UI;
   
   public class HorseActiveNeedUI extends View
   {
      
      protected static var uiView:XML = <View width="474" height="94">
			  <SkillRenderS9 x="380" y="-267" var="render_horseSkill" runtime="game.ui.commons.icons.SkillRenderS9UI"/>
			  <Label text="\l30300042" stroke="0xffffff" mouseEnabled="false" var="txt_state" backgroundColor="0xcfbeaf" autoSize="none" align="center" x="366" height="16" style="重要提示绿" y="-289"/>
			  <Button label="\l40100002" x="367" style="按钮中绿" y="-186" var="btn_changeSkill" mouseChildren="true" buttonMode="true"/>
			  <Box x="-6" y="-1" var="box_cond">
			    <Image skin="png.a5.commonImgs.分割透明底" y="28"/>
			    <Image skin="png.uiHorse.changeHorse.黄光" x="183"/>
			    <Label text="\l30300015" autoSize="none" x="96.5" y="6" style="普通说明" width="300" height="18" align="center" var="title_need1"/>
			    <HorsePreRender y="34" var="renderPre" x="22" runtime="game.ui.horseModules.horseChange.HorsePreRenderUI"/>
			    <HorseMasterRender x="187" y="35" var="renderMaster" runtime="game.ui.horseModules.horseChange.HorseMasterRenderUI"/>
			    <WealthRenderS6 x="350" y="36" var="renderCost" runtime="game.ui.commons.icons.WealthRenderS6UI"/>
			  </Box>
			  <Button label="\l30300013" x="178" style="按钮大绿" y="99" var="btn0" mouseChildren="true"/>
			</View>;
       
      
      public var render_horseSkill:SkillRenderS9UI = null;
      
      public var txt_state:Label = null;
      
      public var btn_changeSkill:Button = null;
      
      public var box_cond:Box = null;
      
      public var title_need1:Label = null;
      
      public var renderPre:game.ui.horseModules.horseChange.HorsePreRenderUI = null;
      
      public var renderMaster:game.ui.horseModules.horseChange.HorseMasterRenderUI = null;
      
      public var renderCost:WealthRenderS6UI = null;
      
      public var btn0:Button = null;
      
      public function HorseActiveNeedUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS9UI"] = SkillRenderS9UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS6UI"] = WealthRenderS6UI;
         viewClassMap["game.ui.horseModules.horseChange.HorseMasterRenderUI"] = game.ui.horseModules.horseChange.HorseMasterRenderUI;
         viewClassMap["game.ui.horseModules.horseChange.HorsePreRenderUI"] = game.ui.horseModules.horseChange.HorsePreRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
