package game.ui.lvlUpModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   
   public class RoleLvlUpModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="378" height="502">
			  <Image skin="png.uiLvlUpModule.光效" x="0" y="-131" var="img_titleBg" visible="false"/>
			  <Box var="box_bg" visible="true">
			    <PanelBgS3 width="378" height="501"/>
			    <Image skin="png.a5.bgs.panelBgs.bgS5" x="19" y="172" width="340" height="262" sizeGrid="10,10,10,10"/>
			  </Box>
			  <Button label="\l999000581" x="49" y="452.5" style="按钮大绿" var="btn_ok"/>
			  <List x="21.5" y="50" repeatY="3" spaceY="7" var="list_prop">
			    <PropListRender name="render" runtime="game.ui.lvlUpModules.PropListRenderUI"/>
			  </List>
			  <List x="23" y="175" repeatY="3" spaceY="2" var="list_function">
			    <FunctionListRender name="render" runtime="game.ui.lvlUpModules.FunctionListRenderUI"/>
			  </List>
			  <Image skin="png.uiLvlUpModule.主角升级-标题字" x="188" var="img_title" anchorX=".5" anchorY=".5" y="0"/>
			  <BtnFaceBook x="193" y="452" var="faceBookView" visible="false" runtime="game.ui.commons.comps.btns.BtnFaceBookUI"/>
			</PopModuleView>;
       
      
      public var img_titleBg:Image = null;
      
      public var box_bg:Box = null;
      
      public var btn_ok:Button = null;
      
      public var list_prop:List = null;
      
      public var list_function:List = null;
      
      public var img_title:Image = null;
      
      public var faceBookView:BtnFaceBookUI = null;
      
      public function RoleLvlUpModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnFaceBookUI"] = BtnFaceBookUI;
         viewClassMap["game.ui.lvlUpModules.FunctionListRenderUI"] = FunctionListRenderUI;
         viewClassMap["game.ui.lvlUpModules.PropListRenderUI"] = PropListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
