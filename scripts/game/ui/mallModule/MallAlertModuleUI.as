package game.ui.mallModule
{
   import morn.customs.components.StaticModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.mallModule.render.MallAlertWealthRenderUI;
   
   public class MallAlertModuleUI extends StaticModuleView
   {
      
      protected static var uiView:XML = <StaticModuleView width="400" height="305" mouseEnabled="false">
			  <Image skin="png.uiMallAlert.img_alertBg" x="-15" y="-35" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiMallAlert.img_libaoBg" x="25" y="57" var="img_llibaoBg" sizeGrid="5,0,0,5"/>
			  <Button label="前往查看" x="123" style="按钮大绿" y="235" var="btn_go"/>
			  <List x="26" y="166" repeatX="5" spaceX="12" var="list_tuijianAndTejia">
			    <MallAlertWealthRender name="render" runtime="game.ui.mallModule.render.MallAlertWealthRenderUI"/>
			  </List>
			  <MallAlertWealthRender x="27" y="57" var="render_libao" runtime="game.ui.mallModule.render.MallAlertWealthRenderUI"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="6" x="333" var="btn_close"/>
			</StaticModuleView>;
       
      
      public var img_llibaoBg:Image = null;
      
      public var btn_go:Button = null;
      
      public var list_tuijianAndTejia:List = null;
      
      public var render_libao:MallAlertWealthRenderUI = null;
      
      public var btn_close:Button = null;
      
      public function MallAlertModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.mallModule.render.MallAlertWealthRenderUI"] = MallAlertWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
