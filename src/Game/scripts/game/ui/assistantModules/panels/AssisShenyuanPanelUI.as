package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Panel;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.numBar.NumBarS1UI;
   import morn.core.components.Box;
   import game.ui.commons.icons.WealthRenderS19UI;
   import game.ui.assistantModules.renders.AssisShenyuanDelRenderUI;
   
   public class AssisShenyuanPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="383" height="545">
			  <PanelBgS3 width="371" height="540" showLightBottom="true" frameVisible="false" x="5" y="3" frameStyle="1"/>
			  <Image skin="png.uiAssistantModules.img_baseBg" x="16" y="35"/>
			  <Button label="保存设置" x="90" style="按钮中绿" y="499" var="btn_save"/>
			  <Panel width="347" mouseEnabled="false" x="18" y="40" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="442" var="panel_view">
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="10"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="146" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="127"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="30"/>
			    <CheckBox label="每个宝箱钻石开启                     次" x="22" y="70" selected="false" style="CheckBox普通" var="check_openTimes"/>
			    <Label text="基础设置" autoSize="none" y="10" style="二级框标题" x="7" var="txt_60200001"/>
			    <Label text="buff优先级设置" autoSize="none" y="126" style="二级框标题" x="7" width="102" height="22" var="txt_60200052"/>
			    <CheckBox label="自动领取每日深渊排名奖励" x="22" y="100" selected="false" style="CheckBox普通" var="check_autoRewardRank"/>
			    <Image skin="png.uiAssistantModules.img_titleBg" x="3" y="155"/>
			    <List x="4" y="177" var="list_buff">
			      <AssisShenyuanDelRender name="render" runtime="game.ui.assistantModules.renders.AssisShenyuanDelRenderUI"/>
			    </List>
			    <Label text="深渊buff名" autoSize="none" x="129" y="158" style="加底标题" width="79" height="19" align="center" var="txt_60200054"/>
			    <Label text="不设置buff优先级，默认按照最高星级购买buff" autoSize="none" y="186" style="二级框标题" x="50.5" width="246" height="46" var="txt_noBuffalert" align="center" size="14" multiline="true" wordWrap="true"/>
			    <Label text="操作" autoSize="none" x="235" y="158" style="加底标题" width="79" height="19" align="center" var="txt_60200055"/>
			    <Label text="购买顺序" autoSize="none" x="-1" y="158" style="加底标题" width="121" height="19" align="center" var="txt_60200053"/>
			    <CheckBox label="自动挑战9星通关关卡" x="22" y="40" selected="true" style="CheckBox普通" var="check_60200049" mouseEnabled="false"/>
			    <NumBarS1 x="143" y="70" var="numberRef" runtime="game.ui.commons.comps.numBar.NumBarS1UI"/>
			    <Box x="240" y="67" mouseEnabled="false" mouseChildren="false" var="box_cost">
			      <WealthRenderS19 x="38" var="wealth_cost" runtime="game.ui.commons.icons.WealthRenderS19UI"/>
			      <Label text="消耗：" autoSize="none" y="5" style="小标题" var="txt_30600218"/>
			    </Box>
			  </Panel>
			  <Button label="buff设定" x="208" style="按钮中黄" y="499" var="btn_buff"/>
			</PanelView>;
       
      
      public var btn_save:Button = null;
      
      public var panel_view:Panel = null;
      
      public var check_openTimes:CheckBox = null;
      
      public var txt_60200001:Label = null;
      
      public var txt_60200052:Label = null;
      
      public var check_autoRewardRank:CheckBox = null;
      
      public var list_buff:List = null;
      
      public var txt_60200054:Label = null;
      
      public var txt_noBuffalert:Label = null;
      
      public var txt_60200055:Label = null;
      
      public var txt_60200053:Label = null;
      
      public var check_60200049:CheckBox = null;
      
      public var numberRef:NumBarS1UI = null;
      
      public var box_cost:Box = null;
      
      public var wealth_cost:WealthRenderS19UI = null;
      
      public var txt_30600218:Label = null;
      
      public var btn_buff:Button = null;
      
      public function AssisShenyuanPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.assistantModules.renders.AssisShenyuanDelRenderUI"] = AssisShenyuanDelRenderUI;
         viewClassMap["game.ui.commons.comps.numBar.NumBarS1UI"] = NumBarS1UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS19UI"] = WealthRenderS19UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
