package game.ui.newYears.luckTrees.panels
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.List;
   import morn.customs.components.Placeholder;
   import game.ui.commons.icons.LotteryRenderS9UI;
   import game.ui.newYears.luckTrees.renders.LuckTreeCostRenderUI;
   import game.ui.commons.comps.others.RedPointUI;
   import game.ui.newYears.luckTrees.renders.PersonTreeBagRenderUI;
   
   public class PersonTreePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="400">
			  <Image skin="png.uiLuckTree.personTree.img_tree" x="139" y="52" var="img_tree_bg"/>
			  <Image skin="png.uiLuckTree.personTree.img_bg2" x="587" y="118"/>
			  <Image skin="png.uiLuckTree.personTree.img_bg" x="588" y="-32"/>
			  <Box x="103" y="11" var="box_progress" width="359" height="60">
			    <ProgressBar skin="png.a5.comps.progresses.progress_S10" x="19" y="19" height="24" sizeGrid="5,0,18,0" var="progressBar"/>
			    <Image skin="png.uiLuckTree.img_progress_rim" y="15"/>
			    <Image skin="png.uiLuckTree.img_progressShine" var="img_progressShine" x="17"/>
			    <Label text="祝福值: 11313/1313" autoSize="none" x="115" y="23" style="普通说明" width="162" height="21" align="center" var="txt_val"/>
			  </Box>
			  <Image skin="png.uiLuckTree.personTree.img_icon_0" x="92" y="11" var="img_icon_tree" autoSize="true"/>
			  <Label text="Date Time CD" autoSize="none" x="409" y="89" style="不足禁止红" width="180" height="32" var="txt_cd" align="left"/>
			  <Image skin="png.a5.commonImgs.img_txtBg" x="586" y="10"/>
			  <Label text="to world tree" autoSize="none" x="250" y="8" style="普通说明" width="211" height="21" align="right" var="txt_to_world_tree"/>
			  <Label text="affiche" autoSize="none" x="597" y="10" style="渐变1" width="182" height="21" align="center" var="txt_title_affiche" size="16"/>
			  <Image skin="png.a5.comps.img_block" x="123" y="69" var="img_tree" width="322" height="292"/>
			  <Label text="tip1" autoSize="none" x="145" y="52" style="普通说明" width="450" height="21" align="left" var="txt_tip1"/>
			  <Label text="return cur lv" autoSize="none" x="185" y="361" style="普通说明" width="262" height="21" align="left" var="txt_returnCurLv" size="16"/>
			  <Label text="lv5" autoSize="none" x="138" y="361" style="小标题" width="75" height="28" align="left" var="txt_show_lv" size="16"/>
			  <Button skin="png.a5.btns.btn_longBar" var="btn_nextLv" stateNum="3" x="451" y="177"/>
			  <Button skin="png.a5.btns.btn_longBar" var="btn_preLv" stateNum="3" x="118" y="229" rotation="180"/>
			  <Button label="按钮" x="648" style="按钮中黄" y="414" var="btn_order"/>
			  <PageBarS2 x="619" y="379" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <List x="602" y="195" repeatX="3" repeatY="3" spaceX="10" spaceY="10" var="list_bag">
			    <PersonTreeBagRender name="render" runtime="game.ui.newYears.luckTrees.renders.PersonTreeBagRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_txtBg" x="586" y="165"/>
			  <Placeholder width="192" height="100" x="591" var="txt_prompt_place" y="38"/>
			  <Label text="bag name" autoSize="none" x="578" y="164" style="渐变1" width="222" height="21" align="center" var="txt_bagName" size="16"/>
			  <Label text="tree lv.4" autoSize="none" x="158" y="8" style="普通说明" width="84" height="20" align="right" var="txt_tree_lv_label"/>
			  <Label text="lv.4" autoSize="none" x="260" y="5" style="渐变1" width="91" height="22" align="left" var="txt_tree_lv"/>
			  <Label text="Date Time CD" autoSize="none" x="409" y="71" style="普通说明" width="156" height="32" var="txt_cd_lab" align="left"/>
			  <Box x="71" y="391" var="box_btns">
			    <Button label="按钮" style="按钮大绿" var="btn_do1" y="5"/>
			    <Button label="按钮" x="140" style="按钮大黄" y="5" var="btn_do10"/>
			    <LotteryRenderS9 x="20" y="40" var="costRender1" runtime="game.ui.commons.icons.LotteryRenderS9UI"/>
			    <LotteryRenderS9 x="160" y="40" var="costRender10" runtime="game.ui.commons.icons.LotteryRenderS9UI"/>
			    <Button label="按钮" x="280" style="按钮大黄" y="5" var="btn_do50"/>
			    <LotteryRenderS9 x="300" y="40" var="costRender50" runtime="game.ui.commons.icons.LotteryRenderS9UI"/>
			    <Box x="406" y="10" var="box_score">
			      <Label text="score:999" autoSize="none" style="小标题" width="162" height="21" align="left" var="txt_score" size="14"/>
			      <LuckTreeCostRender y="24" var="render_cost" style="小标题" runtime="game.ui.newYears.luckTrees.renders.LuckTreeCostRenderUI"/>
			      <Button skin="png.a5.comps.numBars.btn_plus" x="74" y="24" stateNum="1" var="btnBuyItem"/>
			    </Box>
			    <RedPoint x="100" var="redPoi1" runtime="game.ui.commons.comps.others.RedPointUI"/>
			    <RedPoint x="240" var="redPoi10" runtime="game.ui.commons.comps.others.RedPointUI"/>
			    <RedPoint x="380" var="redPoi50" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  </Box>
			</View>;
       
      
      public var img_tree_bg:Image = null;
      
      public var box_progress:Box = null;
      
      public var progressBar:ProgressBar = null;
      
      public var img_progressShine:Image = null;
      
      public var txt_val:Label = null;
      
      public var img_icon_tree:Image = null;
      
      public var txt_cd:Label = null;
      
      public var txt_to_world_tree:Label = null;
      
      public var txt_title_affiche:Label = null;
      
      public var img_tree:Image = null;
      
      public var txt_tip1:Label = null;
      
      public var txt_returnCurLv:Label = null;
      
      public var txt_show_lv:Label = null;
      
      public var btn_nextLv:Button = null;
      
      public var btn_preLv:Button = null;
      
      public var btn_order:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var list_bag:List = null;
      
      public var txt_prompt_place:Placeholder = null;
      
      public var txt_bagName:Label = null;
      
      public var txt_tree_lv_label:Label = null;
      
      public var txt_tree_lv:Label = null;
      
      public var txt_cd_lab:Label = null;
      
      public var box_btns:Box = null;
      
      public var btn_do1:Button = null;
      
      public var btn_do10:Button = null;
      
      public var costRender1:LotteryRenderS9UI = null;
      
      public var costRender10:LotteryRenderS9UI = null;
      
      public var btn_do50:Button = null;
      
      public var costRender50:LotteryRenderS9UI = null;
      
      public var box_score:Box = null;
      
      public var txt_score:Label = null;
      
      public var render_cost:LuckTreeCostRenderUI = null;
      
      public var btnBuyItem:Button = null;
      
      public var redPoi1:RedPointUI = null;
      
      public var redPoi10:RedPointUI = null;
      
      public var redPoi50:RedPointUI = null;
      
      public function PersonTreePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS9UI"] = LotteryRenderS9UI;
         viewClassMap["game.ui.newYears.luckTrees.renders.LuckTreeCostRenderUI"] = LuckTreeCostRenderUI;
         viewClassMap["game.ui.newYears.luckTrees.renders.PersonTreeBagRenderUI"] = PersonTreeBagRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
