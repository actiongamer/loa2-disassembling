package game.ui.gameHelpModule.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   
   public class GameHelpTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="209" height="69">
			  <Image skin="png.uiGameHelp.GM认证-游戏助手-按钮001" x="0" y="0"/>
			  <Image skin="png.a5.comps.img_block" x="52" y="20" mouseChildren="false" mouseEnabled="false" var="img_label" width="108" height="26"/>
			  <Label autoSize="none" y="23" style="渐变1" width="209" height="25" align="center" text="方法" x="0" var="label"/>
			  <Box name="selectBoxAll" var="box_light" mouseChildren="false" mouseEnabled="false" x="0" y="0">
			    <Image skin="png.uiGameHelp.GM认证-游戏助手-按钮002"/>
			    <Image skin="png.a5.comps.img_block" x="52" y="20" var="img_labellight" width="108" height="26"/>
			    <Image skin="png.uiGameHelp.GM认证-游戏助手-按钮003"/>
			    <Label autoSize="none" y="23" style="渐变1" width="209" height="25" align="center" text="方法" x="0" var="labelhl"/>
			  </Box>
			</View>;
       
      
      public var img_label:Image = null;
      
      public var label:Label = null;
      
      public var box_light:Box = null;
      
      public var img_labellight:Image = null;
      
      public var labelhl:Label = null;
      
      public function GameHelpTitleRenderUI()
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
