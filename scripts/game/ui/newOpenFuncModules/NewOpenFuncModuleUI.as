package game.ui.newOpenFuncModules
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class NewOpenFuncModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="600" height="400">
			  <Button label="\l9010100" x="240" style="按钮大绿" y="247" var="btn_confirm"/>
			  <Image skin="png.a5.comps.img_block" x="301" anchorX="0.5" anchorY="0.5" var="img_func" y="155"/>
			  <Label text="普通说明" y="224" style="普通说明" width="147" height="20" align="center" var="txt_desc" x="226"/>
			  <Label text="渐变1" autoSize="none" style="渐变1" width="362" height="22" align="center" var="txt_funcName" x="119" y="15"/>
			</TopModuleView>;
       
      
      public var btn_confirm:Button = null;
      
      public var img_func:Image = null;
      
      public var txt_desc:Label = null;
      
      public var txt_funcName:Label = null;
      
      public function NewOpenFuncModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
