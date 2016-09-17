package game.ui.guildModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   import game.ui.commons.icons.LotteryRenderS1UI;
   
   public class GuildCreatePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="257">
			  <PanelBgS3 width="374" height="257" bgStyle="5" bgSizeGrid="4,35,4,20" x="0" y="0"/>
			  <Image skin="png.uiGuildModule.输入框" x="87" y="94" sizeGrid="4,4,4,4" width="205" height="26"/>
			  <Image skin="png.uiGuildModule.勾选框" x="97" y="142"/>
			  <Label text="\l11000840" autoSize="none" x="91" y="99" bold="false" width="194" var="txt_prompt" height="18" align="center" mouseChildren="false" mouseEnabled="false" style="普通说明"/>
			  <TextInput x="87" y="99" var="txt_gangName" width="201" height="19" align="center" autoSize="none" style="普通说明"/>
			  <Label text="\l11000841" autoSize="left" x="121" y="144" style="普通说明"/>
			  <Label text="\l11000839" autoSize="none" x="87" y="61" style="加底标题" mouseEnabled="false" align="center" width="201" height="18"/>
			  <BtnCancel x="200" y="211" var="cancelBtn" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  <BtnOk x="96" y="211" var="okBtn" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <LotteryRenderS1 x="221" y="141" var="costRender" runtime="game.ui.commons.icons.LotteryRenderS1UI"/>
			  <Image skin="png.uiGuildModule.叹号" x="101" y="141"/>
			</PopModuleView>;
       
      
      public var txt_prompt:Label = null;
      
      public var txt_gangName:TextInput = null;
      
      public var cancelBtn:BtnCancelUI = null;
      
      public var okBtn:BtnOkUI = null;
      
      public var costRender:LotteryRenderS1UI = null;
      
      public function GuildCreatePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.commons.icons.LotteryRenderS1UI"] = LotteryRenderS1UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
