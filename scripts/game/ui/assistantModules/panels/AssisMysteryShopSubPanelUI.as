package game.ui.assistantModules.panels
{
   import morn.customs.components.PanelView;
   import morn.core.components.Tab;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.CheckBox;
   import game.ui.assistantModules.renders.AssisMysShopRenderUI;
   
   public class AssisMysteryShopSubPanelUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="380" height="466">
			  <PanelBgS3 x="3" y="3" width="373" height="458" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Tab labels="神圣,风暴,珍宝,道具" x="22" y="41" style="TAB长" var="tab_group"/>
			  <Image skin="png.uiAssistantModules.img_titleBg" x="19" y="66"/>
			  <Label text="价格" autoSize="none" x="111" y="69" style="加底标题" width="79" height="19" align="center" var="txt_60200067"/>
			  <Label text="操作" autoSize="none" x="261" y="69" style="加底标题" width="79" height="19" align="center"/>
			  <Label text="道具" autoSize="none" x="29" y="69" style="加底标题" width="79" height="19" align="center" var="txt_3020"/>
			  <List x="21" y="89" var="list_items" repeatY="8" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="338" height="304">
			    <AssisMysShopRender name="render" runtime="game.ui.assistantModules.renders.AssisMysShopRenderUI"/>
			  </List>
			  <Label text="\l60200066" autoSize="none" x="183" y="69" style="加底标题" width="79" height="19" align="center"/>
			  <Label text="\l999000826" autoSize="none" x="26" y="420" style="普通说明" width="65" height="20" align="center"/>
			  <CheckBox label="神魂" x="88" y="419" selected="false" style="CheckBox普通" var="checkBox_heroSoul"/>
			  <CheckBox label="钻石" x="165" y="419" selected="false" style="CheckBox普通" var="checkBox_diamond"/>
			</PanelView>;
       
      
      public var tab_group:Tab = null;
      
      public var txt_60200067:Label = null;
      
      public var txt_3020:Label = null;
      
      public var list_items:List = null;
      
      public var checkBox_heroSoul:CheckBox = null;
      
      public var checkBox_diamond:CheckBox = null;
      
      public function AssisMysteryShopSubPanelUI()
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
