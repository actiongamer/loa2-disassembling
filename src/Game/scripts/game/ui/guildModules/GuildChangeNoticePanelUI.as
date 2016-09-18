package game.ui.guildModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.ComboBox;
   import morn.core.components.TextArea;
   import morn.core.components.Label;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import game.ui.commons.comps.btns.BtnOkUI;
   
   public class GuildChangeNoticePanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="381" height="294">
			  <PanelBgS3 width="381" height="292"/>
			  <Image skin="png.uiGuildModule.manage.修改公告小底部9宫格" x="21" y="79" width="334" height="118" sizeGrid="10,10,10,10" centerX="0"/>
			  <ComboBox labels="对内公告,对外公告" x="248" y="50" var="cbx_type" style="Combobox普通"/>
			  <Label text="\l11000848" autoSize="left" x="27" y="54" bold="true" style="升级后加底标题"/>
			  <TextArea x="28" y="88" width="324" height="103" var="txt_content" style="普通说明" leading="2"/>
			  <Label text="普通说明" autoSize="left" x="23" y="201" style="小标题" var="txt_sy"/>
			  <BtnCancel var="cancelBtn" x="198" y="242" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  <BtnOk var="okBtn" x="96" y="242" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			</PopModuleView>;
       
      
      public var cbx_type:ComboBox = null;
      
      public var txt_content:TextArea = null;
      
      public var txt_sy:Label = null;
      
      public var cancelBtn:BtnCancelUI = null;
      
      public var okBtn:BtnOkUI = null;
      
      public function GuildChangeNoticePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
