package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Button;
   import morn.core.components.Panel;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import morn.core.components.List;
   import game.ui.assistantModules.renders.AssisMysShopRenderUI;
   
   public class AssisMysteryShopPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="383" height="545">
			  <PanelBgS3 width="371" height="540" showLightBottom="true" frameVisible="false" x="5" y="3" frameStyle="1"/>
			  <Image skin="png.uiAssistantModules.img_baseBg" x="16" y="35"/>
			  <Button label="保存设置" x="90" style="按钮中绿" y="499" var="btn_save"/>
			  <Panel width="347" mouseEnabled="false" x="18" y="40" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" height="442" var="panel_view">
			    <CheckBox label="每日使用刷新令          次" x="23" y="59" selected="false" style="CheckBox普通" var="check_useItem"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="10"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="130" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.uiAssistantModules.img_lineBg1" x="0" y="111"/>
			    <Image skin="png.uiAssistantModules.img_lineBg3" x="-19" y="30"/>
			    <CheckBox label="自动免费刷新英雄商店" x="23" y="36" selected="true" style="CheckBox普通" mouseEnabled="false" var="check_60200068"/>
			    <Image skin="png.a5.comps.numBars.img_numBg" x="0" y="59" width="34" height="23" lgx="232,132,232,301,281,232,232,280"/>
			    <Label text="基础设置" autoSize="none" y="10" style="二级框标题" x="7" var="txt_60200001" width="265" height="20"/>
			    <Label text="购买设置" autoSize="none" y="110" style="二级框标题" x="7" width="308" height="22" var="txt_60200070"/>
			    <Image skin="png.uiAssistantModules.img_titleBg" x="3" y="143"/>
			    <Label text="\l60200085" autoSize="none" x="95" y="146" style="加底标题" width="79" height="19" align="center" var="txt_60200067"/>
			    <Label text="操作" autoSize="none" x="245" y="146" style="加底标题" width="79" height="19" align="center" var="txt_60200055"/>
			    <Label text="道具" autoSize="none" x="13" y="146" style="加底标题" width="79" height="19" align="center" var="txt_3020"/>
			    <TextInput text="0" x="0" y="61" width="35" height="22" var="txt_useTimes" align="center" style="普通说明" restrict="0-9" lgx="231,131,231,300,280,231,231,280"/>
			    <List x="5" y="165" var="list_items">
			      <AssisMysShopRender name="render" runtime="game.ui.assistantModules.renders.AssisMysShopRenderUI"/>
			    </List>
			    <Label text="已拥有" autoSize="none" x="167" y="146" style="加底标题" width="79" height="19" align="center" var="txt_60200066"/>
			    <CheckBox label="\l999902525" x="23" y="83" selected="false" style="CheckBox普通" mouseEnabled="true" var="check_lockBuy"/>
			  </Panel>
			  <Button label="添加道具" x="208" style="按钮中黄" y="499" var="btn_addItem"/>
			</PanelView>;
       
      
      public var btn_save:Button = null;
      
      public var panel_view:Panel = null;
      
      public var check_useItem:CheckBox = null;
      
      public var check_60200068:CheckBox = null;
      
      public var txt_60200001:Label = null;
      
      public var txt_60200070:Label = null;
      
      public var txt_60200067:Label = null;
      
      public var txt_60200055:Label = null;
      
      public var txt_3020:Label = null;
      
      public var txt_useTimes:TextInput = null;
      
      public var list_items:List = null;
      
      public var txt_60200066:Label = null;
      
      public var check_lockBuy:CheckBox = null;
      
      public var btn_addItem:Button = null;
      
      public function AssisMysteryShopPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.assistantModules.renders.AssisMysShopRenderUI"] = AssisMysShopRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
