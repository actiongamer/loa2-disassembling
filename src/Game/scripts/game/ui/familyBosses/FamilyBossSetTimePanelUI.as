package game.ui.familyBosses
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.familyBosses.render.FamilyBossTimeRenderUI;
   
   public class FamilyBossSetTimePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="572" height="290">
			  <GRect fillAlpha="0.6" radius="0,0,0,0" lineAlpha="0" width="1600" height="900" centerX="0" centerY="0" fillColor="0x000000" x="34" y="30"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板四级" x="38" y="12" centerX="0"/>
			  <Image skin="png.uiFamilyBosses.分割线" x="90.5" y="48" centerX="0"/>
			  <Box x="222" y="256" centerX="0">
			    <Button label="确定" style="按钮大绿" var="btn_confirm"/>
			    <Button label="取消" style="按钮大黄" var="btn_cancel" x="152"/>
			  </Box>
			  <List x="138" y="88" repeatX="4" repeatY="2" spaceX="10" spaceY="10" var="list_timetable" centerX="0">
			    <FamilyBossTimeRender name="render" runtime="game.ui.familyBosses.render.FamilyBossTimeRenderUI"/>
			  </List>
			  <Label text="普通说明" autoSize="none" x="56" y="59" style="普通说明" width="519" height="20" centerX="0" align="center" var="txt_info"/>
			  <Label text="时间选择" autoSize="none" x="40.5" y="27" style="渐变1" width="519" height="20" centerX="0" align="center" size="14"/>
			</PopModuleView>;
       
      
      public var btn_confirm:Button = null;
      
      public var btn_cancel:Button = null;
      
      public var list_timetable:List = null;
      
      public var txt_info:Label = null;
      
      public function FamilyBossSetTimePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.FamilyBossTimeRenderUI"] = FamilyBossTimeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
