package game.ui.battlefield
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import game.ui.battlefield.render.BattlefieldApplyRenderUI;
   import morn.core.components.List;
   import morn.core.components.Box;
   import game.ui.battlefield.render.BattlefieldFunBtnRenderUI;
   
   public class BattlefieldModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg width="804" height="551" showTabLine="true" x="0" y="0"/>
			  <Image skin="png.uiBattlefields.img_infoBg" x="6" y="458" width="212" height="82"/>
			  <Tab labels="水晶争夺战,夺旗" x="29" y="40" style="TAB超长" var="tab_battlefield"/>
			  <Label text="我的积分：1" autoSize="none" x="25" y="480" style="普通说明" width="122" align="left" height="20" var="txt_myScore" visible="true"/>
			  <Label text="我的排位：黄金一阶" autoSize="none" x="25" y="500" style="普通说明" width="133" align="left" height="20" var="txt_myGrade" visible="true"/>
			  <Label text="本赛季剩余天数：10天" autoSize="none" x="24" y="520" style="普通说明" width="493" align="left" height="20" var="txt_leftDays" visible="true"/>
			  <BattlefieldApplyRender x="308" y="328" var="render_apply" runtime="game.ui.battlefield.render.BattlefieldApplyRenderUI"/>
			  <List x="720" y="75" repeatY="2" var="list_rightTop">
			    <BattlefieldFunBtnRender name="render" runtime="game.ui.battlefield.render.BattlefieldFunBtnRenderUI"/>
			  </List>
			  <List repeatX="3" var="list_btnsBottom" x="547" y="470">
			    <BattlefieldFunBtnRender name="render" runtime="game.ui.battlefield.render.BattlefieldFunBtnRenderUI"/>
			  </List>
			  <Box x="152" y="332" var="box_punishTime">
			    <Label autoSize="none" x="168" y="36" style="渐变红" align="center" bold="true" visible="true" width="168" height="34" var="txt_punishAlert" text="20:30" size="25"/>
			    <Label text="正在惩罚时间，还剩余" autoSize="none" style="渐变红" width="499" height="27" align="center" size="23" wordWrap="true"/>
			  </Box>
			  <Label text="\l50500139" autoSize="none" style="重要提示绿" width="431" align="center" wordWrap="true" x="184.5" y="108" visible="true"/>
			  <Label text="今日已胜：" autoSize="none" x="25" y="462" style="普通说明" width="175" align="left" height="20" var="txt_todayWinned"/>
			</PopModuleView>;
       
      
      public var tab_battlefield:Tab = null;
      
      public var txt_myScore:Label = null;
      
      public var txt_myGrade:Label = null;
      
      public var txt_leftDays:Label = null;
      
      public var render_apply:BattlefieldApplyRenderUI = null;
      
      public var list_rightTop:List = null;
      
      public var list_btnsBottom:List = null;
      
      public var box_punishTime:Box = null;
      
      public var txt_punishAlert:Label = null;
      
      public var txt_todayWinned:Label = null;
      
      public function BattlefieldModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.render.BattlefieldApplyRenderUI"] = BattlefieldApplyRenderUI;
         viewClassMap["game.ui.battlefield.render.BattlefieldFunBtnRenderUI"] = BattlefieldFunBtnRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
