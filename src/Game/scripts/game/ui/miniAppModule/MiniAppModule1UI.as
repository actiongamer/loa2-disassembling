package game.ui.miniAppModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS9UI;
   
   public class MiniAppModule1UI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="21" y="0" width="810" height="560"/>
			  <Image skin="png.uiMiniApp1.img_title" x="35" y="31"/>
			  <Image x="-520" y="-140" width="730" height="590" var="img_block" skin="png.a5.comps.img_block"/>
			  <Image skin="png.uiMiniApp1.img_bg" x="30" y="115" width="790" height="435"/>
			  <Image skin="png.uiMiniApp1.img_rim" x="52" y="139" var="img_selectWin" sizeGrid="20,20,20,20" width="355" height="235"/>
			  <Image skin="png.uiMiniApp1.img_rim" x="445" y="139" var="img_selectMac" width="355" height="235" sizeGrid="20,20,20,20"/>
			  <Button label="按钮" x="363" style="按钮大绿" y="477" var="btn_get"/>
			  <Box x="171" y="477" var="box_down">
			    <Button label="按钮" style="按钮大绿" var="btn_downWin"/>
			    <Button label="按钮" x="375" style="按钮大绿" var="btn_downMac"/>
			    <Label text="For Windows" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="108" align="center" y="36" backgroundColor="0xcfbeaf" color="0xffffff" height="18" x="6" mouseChildren="false"/>
			    <Label text="For MacOS" stroke="0xffffff" mouseEnabled="false" var="txt_nameMac" width="108" align="center" y="36" backgroundColor="0xcfbeaf" color="0xffffff" height="18" x="381" mouseChildren="false"/>
			  </Box>
			  <List x="322" y="391" repeatX="3" spaceX="12" var="list_reward">
			    <WealthRenderS9 name="render" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_block:Image = null;
      
      public var img_selectWin:Image = null;
      
      public var img_selectMac:Image = null;
      
      public var btn_get:Button = null;
      
      public var box_down:Box = null;
      
      public var btn_downWin:Button = null;
      
      public var btn_downMac:Button = null;
      
      public var txt_name:Label = null;
      
      public var txt_nameMac:Label = null;
      
      public var list_reward:List = null;
      
      public function MiniAppModule1UI()
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
