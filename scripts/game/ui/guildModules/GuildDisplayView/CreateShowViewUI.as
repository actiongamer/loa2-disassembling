package game.ui.guildModules.GuildDisplayView
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class CreateShowViewUI extends View
   {
      
      protected static var uiView:XML = <View width="388" height="501">
			  <Image skin="jpg.uiGuildModule.show.创建底图" x="0" y="-1"/>
			  <Button label="\l11000821" x="134" y="311" style="按钮大绿" var="btn_create"/>
			  <Box x="7" y="361" var="box_bottom" toolTip="\l11000019">
			    <Image skin="png.uiGuildModule.show.福利底框" x="0"/>
			    <Image skin="png.uiGuildModule.show.配图1" x="71.5" y="35" var="img_icon1"/>
			    <Image skin="png.uiGuildModule.show.配图2" x="242.5" y="35" var="img_icon2"/>
			    <Label text="\l11000911" x="21" y="9" style="加底标题" width="330" height="18" align="center"/>
			    <Label text="\l11000823" autoSize="none" x="25.5" y="106" style="普通说明" width="153" height="18" align="center"/>
			    <Label text="\l11000824" autoSize="none" x="184" y="106" style="普通说明" align="center" width="174" height="18"/>
			  </Box>
			</View>;
       
      
      public var btn_create:Button = null;
      
      public var box_bottom:Box = null;
      
      public var img_icon1:Image = null;
      
      public var img_icon2:Image = null;
      
      public function CreateShowViewUI()
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
