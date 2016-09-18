package game.ui.newOpenFuncModules
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class NewOpenFuncMiniModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="150" height="150">
			  <Button stateNum="1" var="btn_zoom" style="按钮翻页" x="26" y="29" scaleX="-1"/>
			  <Label text="新功能" style="普通说明" align="center" x="2" multiline="true" wordWrap="true" width="21" autoSize="center" centerY="0" var="txt_des" mouseEnabled="false" mouseChildren="false"/>
			  <Box x="1" y="60" var="box_info">
			    <Image skin="png.a5.comps.img_block" x="75" anchorX="0.5" anchorY="0.5" var="img_func"/>
			    <Label text="普通说明" y="69" style="普通说明" width="147" height="20" align="center" var="txt_openLevel"/>
			    <Label text="渐变1" autoSize="none" y="46" style="渐变1" width="148" height="22" align="center" var="txt_funcName"/>
			  </Box>
			</StaticModuleView>;
       
      
      public var btn_zoom:Button = null;
      
      public var txt_des:Label = null;
      
      public var box_info:Box = null;
      
      public var img_func:Image = null;
      
      public var txt_openLevel:Label = null;
      
      public var txt_funcName:Label = null;
      
      public function NewOpenFuncMiniModuleUI()
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
