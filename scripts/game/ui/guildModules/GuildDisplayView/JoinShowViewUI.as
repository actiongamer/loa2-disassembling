package game.ui.guildModules.GuildDisplayView
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class JoinShowViewUI extends View
   {
      
      protected static var uiView:XML = <View width="388" height="501">
			  <Image skin="jpg.uiGuildModule.show.加入底图" x="0" y="-1"/>
			  <Button label="\l11000822" x="134" y="311" style="按钮大黄" var="btn_join"/>
			  <Box x="8" y="361" var="box_bottom" toolTip="\l11000020">
			    <Image skin="png.uiGuildModule.show.福利底框"/>
			    <Image skin="png.uiGuildModule.show.配图1" x="72" y="35" var="img_icon1"/>
			    <Image skin="png.uiGuildModule.show.配图2" x="243" y="35" var="img_icon2"/>
			    <Label text="\l11000825" autoSize="none" x="22" y="106" style="普通说明" width="157" height="18" align="center"/>
			    <Label text="\l11000826" autoSize="none" x="198" y="106" style="普通说明" width="153" height="18" align="center"/>
			    <Label text="\l11000910" x="121" y="9" style="加底标题" width="128" height="18" align="center"/>
			  </Box>
			</View>;
       
      
      public var btn_join:Button = null;
      
      public var box_bottom:Box = null;
      
      public var img_icon1:Image = null;
      
      public var img_icon2:Image = null;
      
      public function JoinShowViewUI()
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
