package game.ui.miniTasks
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.icons.LotteryRenderS3UI;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class TaskDetailInfoPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="361" height="384">
			  <PanelBg x="24" y="5" width="317" height="384"/>
			  <Image skin="png.uiMiniTask.img_titleBg" x="42" y="171" width="281" height="23"/>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS7" x="42" y="194" width="281" height="120" sizeGrid="2,2,2,2"/>
			  <Button label="前往" stateNum="1" buttonMode="true" labelColors="0xeac472,0xe1dfd6,0xada99b" labelSize="13" x="133.5" y="327" var="btn_go" sizeGrid="53,15,53,15" style="按钮中蓝"/>
			  <List x="52" y="246" repeatX="5" spaceX="3" var="list_reward">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="任务奖励" autoSize="left" x="50" y="57" color="0xcbc2a3" width="185" height="21" bold="false" size="14" labelFilterKind="0" var="txt_title"/>
			  <Button label="领取" stateNum="1" buttonMode="true" labelColors="0xeac472,0xe1dfd6,0xada99b" labelSize="13" letterSpacing="2" x="133.5" y="327" var="btn_finish" style="按钮中绿"/>
			  <Image skin="png.a5.comps.img_block" x="145" y="169" width="71" height="26" var="img_titleBg"/>
			  <Label text="任务奖励" autoSize="left" x="51" y="82" color="0xcc9350" width="262" height="69" bold="false" size="12" wordWrap="true" multiline="true" var="txt_content" isHtml="true"/>
			  <Image skin="png.uiMiniTask.img_line" x="42" y="158"/>
			  <LotteryRenderS3 x="53" y="209" var="render_gold" runtime="game.ui.commons.icons.LotteryRenderS3UI"/>
			</PopModuleView>;
       
      
      public var btn_go:Button = null;
      
      public var list_reward:List = null;
      
      public var txt_title:Label = null;
      
      public var btn_finish:Button = null;
      
      public var img_titleBg:Image = null;
      
      public var txt_content:Label = null;
      
      public var render_gold:LotteryRenderS3UI = null;
      
      public function TaskDetailInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS3UI"] = LotteryRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
