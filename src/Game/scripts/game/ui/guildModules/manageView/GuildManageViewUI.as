package game.ui.guildModules.manageView
{
   import morn.customs.components.FadeView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.customs.components.GRect;
   
   public class GuildManageViewUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="jpg.uiGuildModule.manage.管理底部" x="2" y="2"/>
			  <List x="33" y="15" repeatX="4" repeatY="2" spaceX="6" spaceY="2" var="list_btns">
			    <ManagerListRender name="render" runtime="game.ui.guildModules.manageView.ManagerListRenderUI"/>
			  </List>
			  <Button label="按钮" y="439" style="按钮小红" x="660" var="btn_exit" width="90" height="26"/>
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" x="660" y="438.5" width="90" height="27" var="btnTipArea"/>
			  <Image skin="png.uiGuildModule.线" x="5" y="432"/>
			</FadeView>;
       
      
      public var list_btns:List = null;
      
      public var btn_exit:Button = null;
      
      public var btnTipArea:GRect = null;
      
      public function GuildManageViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildModules.manageView.ManagerListRenderUI"] = ManagerListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
