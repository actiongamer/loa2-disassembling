package game.ui.miniAppModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class MiniAppModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="350">
			  <Image skin="png.uiMiniApp.背景图" x="75" y="28"/>
			  <Image skin="png.uiMiniApp.底" x="74" y="146"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级框" x="59" y="-9" width="548" height="367" sizeGrid="72,136,72,53"/>
			  <Image x="-439" y="-103" width="730" height="590" var="img_block" skin="png.a5.comps.img_block"/>
			  <Button skin="png.uiMiniApp.VIP按钮" x="257" y="295" stateNum="1" var="btn_down" label="下载微端"/>
			  <List x="156" y="215" repeatX="5" spaceX="12" var="list_reward" centerX="30">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_closeS1" y="-10" stateNum="1" var="btn_close" x="562"/>
			  <Label text="渐变2" autoSize="none" x="110" y="5" style="渐变2" width="448" height="20" align="center" var="txt_title"/>
			  <Image skin="png.uiMiniApp.文字1" x="172" y="38"/>
			  <Image skin="png.uiMiniApp.文字2" x="243" y="156"/>
			  <Image skin="png.uiMiniApp.文字3" x="275" y="183"/>
			</PopModuleView>;
       
      
      public var img_block:Image = null;
      
      public var btn_down:Button = null;
      
      public var list_reward:List = null;
      
      public var btn_close:Button = null;
      
      public var txt_title:Label = null;
      
      public function MiniAppModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
