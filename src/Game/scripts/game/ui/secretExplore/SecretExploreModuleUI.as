package game.ui.secretExplore
{
   import morn.customs.components.SceneModuleView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.comps.others.RedPointUI;
   import morn.core.components.CheckBox;
   import game.ui.commons.comps.others.RuleDescriptionUI;
   
   public class SecretExploreModuleUI extends SceneModuleView
   {
      
      protected static var uiView:XML = <SceneModuleView width="600" height="400">
			  <Image skin="png.comp.image" x="0" y="0" var="img_bg0"/>
			  <Box x="12" y="66" left="0" top="180" var="rank_panel">
			    <Image skin="png.uiSecretExplore.img_rank_bg" width="160" height="197" sizeGrid="10,10,10,10" x="0" y="0"/>
			    <Button skin="png.uiSecretExplore.女神2封神界面_19" x="106" y="12" var="btn_getSwap" stateNum="1" width="36" height="36"/>
			    <Button skin="png.uiSecretExplore.女神2封神界面_06" x="108" y="61" var="btn_rank" stateNum="1"/>
			    <Label text="\l60800007" autoSize="left" x="8" y="8" style="小标题"/>
			    <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" letterSpacing="2" skin="png.a5.btns.btn_addGreen" x="94" y="128" var="btn_buyTimes"/>
			    <Label text="\l50700102" autoSize="left" x="8" y="61" style="小标题"/>
			    <Label text="\l50200002" autoSize="left" x="8" y="110" style="小标题"/>
			    <Label text="0" autoSize="none" x="4" y="81" style="渐变1" var="txt_scoreValue" align="center" width="73"/>
			    <Label text="47/99" autoSize="none" x="6" y="130" style="普通说明" var="txt_times" width="69" height="18" align="center"/>
			    <Label text="\l9011800" autoSize="left" x="86" y="85" style="小标题" align="center" var="txt_rankTip" width="75" height="18" mouseChildren="false" mouseEnabled="false" selectable="false"/>
			    <Label text="\l50200402" autoSize="left" x="86" y="33" style="小标题" align="center" var="txt_scoreSwapTip" width="75" height="18" mouseChildren="false" mouseEnabled="false" selectable="false"/>
			    <Label text="99999" autoSize="none" x="6" y="28" style="渐变1" var="txt_rank" align="center" width="68"/>
			    <RedPoint x="132" y="11" var="scoreSwapRedPoi" runtime="game.ui.commons.comps.others.RedPointUI"/>
			    <CheckBox label="----" x="10" y="160" selected="true" style="CheckBox普通" var="chk_fastfight" labelMargin="8"/>
			    <Box y="84" var="left_dock" x="154">
			      <Button skin="png.uiSecretExplore.btn_dock" stateNum="1" var="btn_left_dock"/>
			      <Image skin="png.uiSecretExplore.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_left" anchorX=".5" anchorY=".5" x="10"/>
			    </Box>
			  </Box>
			  <RuleDescription right="20" top="20" var="box_rule" x="50" y="50" runtime="game.ui.commons.comps.others.RuleDescriptionUI"/>
			  <Box x="156" y="24" top="30" centerX="0">
			    <Image skin="png.uiSecretExplore.img_title_bg"/>
			    <Label text="秘境探险" autoSize="none" x="55" y="15" style="渐变1" var="txt_title" align="center" width="187" height="25"/>
			  </Box>
			</SceneModuleView>;
       
      
      public var img_bg0:Image = null;
      
      public var rank_panel:Box = null;
      
      public var btn_getSwap:Button = null;
      
      public var btn_rank:Button = null;
      
      public var btn_buyTimes:Button = null;
      
      public var txt_scoreValue:Label = null;
      
      public var txt_times:Label = null;
      
      public var txt_rankTip:Label = null;
      
      public var txt_scoreSwapTip:Label = null;
      
      public var txt_rank:Label = null;
      
      public var scoreSwapRedPoi:RedPointUI = null;
      
      public var chk_fastfight:CheckBox = null;
      
      public var left_dock:Box = null;
      
      public var btn_left_dock:Button = null;
      
      public var img_dock_left:Image = null;
      
      public var box_rule:RuleDescriptionUI = null;
      
      public var txt_title:Label = null;
      
      public function SecretExploreModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.comps.others.RuleDescriptionUI"] = RuleDescriptionUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
