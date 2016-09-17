package game.ui.dialModule.panels
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.dialModule.renders.DialMyScoreRenderUI;
   import game.ui.dialModule.renders.DialRankRenderUI;
   
   public class DialRankPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiDialModules.img_rankBg" x="32" y="71"/>
			  <Label text="排名" autoSize="none" x="63" y="82" style="加底标题" width="100" height="20" size="14" var="txt_60800016" align="center"/>
			  <Label text="积分" autoSize="none" x="173" y="82" style="加底标题" width="100" height="20" size="14" var="txt_60800017" align="center"/>
			  <Label text="超级奖励" autoSize="none" x="392" y="82" style="加底标题" width="315" height="20" size="14" var="txt_60800019" align="right"/>
			  <Label text="奖励" autoSize="none" x="326" y="82" style="加底标题" width="140" height="20" size="14" var="txt_60800018" align="center"/>
			  <List x="47" y="112" repeatY="5" width="678" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="list_rank">
			    <DialRankRender name="render" runtime="game.ui.dialModule.renders.DialRankRenderUI"/>
			  </List>
			  <Image skin="png.uiDialModules.img_infoBg" x="238" y="21" width="287"/>
			  <Label text="活动时间：" autoSize="none" x="241" y="22" style="渐变1" width="251" height="22" align="left" size="14" var="txt_time"/>
			  <Label text="积分大于500能够上榜" autoSize="none" x="241" y="40" style="渐变1" width="327" height="22" align="left" size="14" var="txt_60800015"/>
			  <Label text="我的名次" autoSize="none" x="571" y="42" style="渐变1" width="272" height="22" align="left" size="14" var="txt_rank"/>
			  <Label text="积分将于活动结束后清零" autoSize="none" x="571" y="61" style="渐变1" width="285" height="22" align="left" size="14" var="txt_60800026"/>
			  <DialMyScoreRender x="548" y="20" var="render_myScore" runtime="game.ui.dialModule.renders.DialMyScoreRenderUI"/>
			  <Label text="积分大于500能够上榜" autoSize="none" x="241" y="58" style="渐变1" width="321" height="22" align="left" size="14" var="txt_60800029"/>
			</View>;
       
      
      public var txt_60800016:Label = null;
      
      public var txt_60800017:Label = null;
      
      public var txt_60800019:Label = null;
      
      public var txt_60800018:Label = null;
      
      public var list_rank:List = null;
      
      public var txt_time:Label = null;
      
      public var txt_60800015:Label = null;
      
      public var txt_rank:Label = null;
      
      public var txt_60800026:Label = null;
      
      public var render_myScore:DialMyScoreRenderUI = null;
      
      public var txt_60800029:Label = null;
      
      public function DialRankPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.dialModule.renders.DialMyScoreRenderUI"] = DialMyScoreRenderUI;
         viewClassMap["game.ui.dialModule.renders.DialRankRenderUI"] = DialRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
