package game.ui.dialModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import game.ui.dialModule.panels.DialBagPanelUI;
   import game.ui.dialModule.renders.DialMyScoreRenderUI;
   import game.ui.dialModule.renders.DialWealthRenderUI;
   import morn.core.components.List;
   import morn.core.components.Tab;
   import game.ui.dialModule.panels.DialOverPanelUI;
   import morn.core.components.Label;
   
   public class DialModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400" mouseChildren="true" mouseEnabled="false">
			  <Image skin="png.uiDialModules.img_bg" x="-123" y="-160"/>
			  <Image skin="png.uiDialModules.img_title" x="268" y="-100" var="img_title"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="-49" x="740" var="btn_close"/>
			  <Box x="552" y="30" var="box_dialInfo">
			    <DialBagPanel y="99" var="panel_bag" runtime="game.ui.dialModule.panels.DialBagPanelUI"/>
			    <DialMyScoreRender var="render_myScore" runtime="game.ui.dialModule.renders.DialMyScoreRenderUI"/>
			    <DialWealthRender var="render_item" y="27" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			    <List y="50" var="list_coin" repeatY="2" spaceY="-2">
			      <DialWealthRender name="render" runtime="game.ui.dialModule.renders.DialWealthRenderUI"/>
			    </List>
			  </Box>
			  <Tab labels="label1,label2,label3,label4" skin="png.uiDialModules.tab_kind" x="0" y="-13" var="tabBar"/>
			  <DialOverPanel x="47" y="-15" var="panel_over" mouseChildren="false" mouseEnabled="false" runtime="game.ui.dialModule.panels.DialOverPanelUI"/>
			  <Button skin="png.a5.commonImgs.img_rule" x="706" y="-49" var="btn_rule" stateNum="1"/>
			  <Label autoSize="none" x="170" y="-90" style="渐变1" align="center" width="398" height="63" text="\l133550002 " bold="true" size="40" var="txtModuleTitle"/>
			</PopModuleView>;
       
      
      public var img_title:Image = null;
      
      public var btn_close:Button = null;
      
      public var box_dialInfo:Box = null;
      
      public var panel_bag:DialBagPanelUI = null;
      
      public var render_myScore:DialMyScoreRenderUI = null;
      
      public var render_item:DialWealthRenderUI = null;
      
      public var list_coin:List = null;
      
      public var tabBar:Tab = null;
      
      public var panel_over:DialOverPanelUI = null;
      
      public var btn_rule:Button = null;
      
      public var txtModuleTitle:Label = null;
      
      public function DialModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.dialModule.panels.DialBagPanelUI"] = DialBagPanelUI;
         viewClassMap["game.ui.dialModule.panels.DialOverPanelUI"] = DialOverPanelUI;
         viewClassMap["game.ui.dialModule.renders.DialMyScoreRenderUI"] = DialMyScoreRenderUI;
         viewClassMap["game.ui.dialModule.renders.DialWealthRenderUI"] = DialWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
