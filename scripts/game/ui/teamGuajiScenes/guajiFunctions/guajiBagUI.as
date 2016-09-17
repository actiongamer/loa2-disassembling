package game.ui.teamGuajiScenes.guajiFunctions
{
   import morn.customs.components.StaticModuleView;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class guajiBagUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="373" height="397">
			  <PanelBgS3 x="0" y="0" height="397" width="373" frameVisible="true"/>
			  <PageBarS2 x="116" y="355" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			  <Button label="一键提取" y="61" style="按钮中黄" x="268" var="btn_collect"/>
			  <Label text="战斗次数: 9999次" autoSize="none" x="32" y="40" style="普通说明" width="162" height="21" align="left" var="txt_total_battle"/>
			  <Label text="胜率: 88.8%" autoSize="none" x="244" y="40" style="普通说明" width="108" height="21" align="right" var="txt_total_ratio"/>
			  <List x="35" y="95" repeatX="5" repeatY="4" width="291" height="159" spaceX="13" spaceY="13" var="list_wealth">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="\l41210605" autoSize="none" x="57" y="201" style="普通说明" width="264" height="21" align="center" var="txt_bag_tip" visible="false"/>
			  <Image skin="png.a5.commonImgs.线" x="13" y="92" width="354"/>
			  <Label text="\l999900126" autoSize="none" x="32" style="重要提示绿" width="236" align="left" wordWrap="true" multiline="true" centerY="-125"/>
			</StaticModuleView>;
       
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var btn_collect:Button = null;
      
      public var txt_total_battle:Label = null;
      
      public var txt_total_ratio:Label = null;
      
      public var list_wealth:List = null;
      
      public var txt_bag_tip:Label = null;
      
      public function guajiBagUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
