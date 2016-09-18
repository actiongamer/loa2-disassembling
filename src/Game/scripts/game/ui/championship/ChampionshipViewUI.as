package game.ui.championship
{
   import morn.customs.components.SceneModuleView;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.championship.comp.GroupListRenderUI;
   
   public class ChampionshipViewUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="1500" height="900">
			  <RuleDescription right="50" top="20" var="box_rule" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <Image skin="png.uiChampionship.时间图标" centerX="-80" centerY="215"/>
			  <Label text="离下一争霸赛" autoSize="none" style="下划线黄色" var="txt_status" centerX="135" centerY="218" align="left" width="406" height="20"/>
			  <Box buttonMode="true" var="box_gamble" centerX="-80" centerY="246">
			    <Button skin="png.uiChampionship.btn_gambleRecord" stateNum="1" var="btn_myGamble"/>
			    <Label text="\l999902567" autoSize="none" x="42" y="9" style="渐变1" width="142" height="25" align="left"/>
			  </Box>
			  <Box buttonMode="true" var="box_record" centerX="105" centerY="246">
			    <Button skin="png.uiChampionship.btn_fightRecord" stateNum="1"/>
			    <Label text="\l999902568" autoSize="none" x="42" y="9" style="渐变1" width="142" height="25" align="left"/>
			  </Box>
			  <Box centerX="0" centerY="150" x="0" y="0">
			    <Button skin="png.a5.commonImgs.btn_reward2" x="70" stateNum="1" var="btn_chest"/>
			    <Label text="争霸宝箱" autoSize="none" y="43" style="渐变2" width="200" height="19" align="center" mouseEnabled="false" mouseChildren="false"/>
			  </Box>
			  <Box centerX="0" var="box_top" y="100">
			    <Image skin="png.uiChampionship.黑色透明底03"/>
			    <List y="20" repeatX="5" spaceX="10" var="list_group" x="40">
			      <GroupListRender name="render" runtime="game.ui.championship.comp.GroupListRenderUI"/>
			    </List>
			  </Box>
			</SceneModuleView>;
       
      
      public var box_rule:RuleDescriptionUI = null;
      
      public var txt_status:Label = null;
      
      public var box_gamble:Box = null;
      
      public var btn_myGamble:Button = null;
      
      public var box_record:Box = null;
      
      public var btn_chest:Button = null;
      
      public var box_top:Box = null;
      
      public var list_group:List = null;
      
      public function ChampionshipViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.GroupListRenderUI"] = GroupListRenderUI;
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
