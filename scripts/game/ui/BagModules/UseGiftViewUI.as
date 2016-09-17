package game.ui.BagModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Tab;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class UseGiftViewUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="454" height="440">
			  <Image skin="png.uiSendChoco.img_grid" x="-43" y="-37"/>
			  <Image skin="png.uiSendChoco.img_title" x="38" y="-42"/>
			  <Tab x="32" y="19" style="TAB暗红色" labels="label1,label2" selectedIndex="0" var="tab1"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" sizeGrid="4,4,4,4" left="14" right="14" top="61" bottom="56" x="14" y="61"/>
			  <PageBarS1 x="179" y="388" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			  <Button label="一键XX" buttonMode="true" labelFont="SSZH" x="343" y="386" var="btn_doAll" style="按钮中绿"/>
			  <List x="23" y="71" repeatY="6" spaceY="4" var="list_player" width="410" height="308">
			    <UseGiftRender name="render" runtime="game.ui.BagModules.UseGiftRenderUI"/>
			  </List>
			  <Label text="战力:xxx" x="219" y="42" var="txt_prompt" width="218" height="18" style="普通说明暗色" align="right"/>
			  <List x="19" y="64" var="list_log" repeatY="12">
			    <GetGiftRender name="render" runtime="game.ui.BagModules.GetGiftRenderUI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_closeS1" x="443" y="-15" stateNum="1" var="btn_close"/>
			  <Image skin="png.uiSendChoco.img_bottom" x="2" y="414"/>
			  <Image skin="png.uiSendChoco.img_bar" x="14" y="42"/>
			  <Label text="pageBarS2" autoSize="none" x="19" y="44" style="普通说明" width="417" height="20" align="center" var="label_hint"/>
			  <Label text="\l999003115" autoSize="none" x="145" y="-29" style="渐变4" width="158" height="30" align="center" bold="true"/>
			</PopModuleView>;
       
      
      public var tab1:Tab = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_doAll:Button = null;
      
      public var list_player:List = null;
      
      public var txt_prompt:Label = null;
      
      public var list_log:List = null;
      
      public var btn_close:Button = null;
      
      public var label_hint:Label = null;
      
      public function UseGiftViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.BagModules.GetGiftRenderUI"] = GetGiftRenderUI;
         viewClassMap["game.ui.BagModules.UseGiftRenderUI"] = UseGiftRenderUI;
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
