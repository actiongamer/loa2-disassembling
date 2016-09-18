package game.ui.dungeonScene
{
   import morn.core.components.View;
   import morn.customs.components.GRect;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   
   public class DramaSayS3UI extends View
   {
      
      protected static var uiView:XML = <View width="800" height="400">
			  <GRect fillAlpha="0.3" radius="0,0,0,0" lineAlpha="0" x="-400" y="-600" width="1600" height="1000" var="cover" fillColor="0x0"/>
			  <Image skin="png.a5.comps.img_block" x="668" y="269" anchorX="0.5" var="img_right" anchorY="1" autoSize="true" width="300" height="300"/>
			  <Image skin="png.a5.comps.img_block" x="152" y="259" anchorX="0.5" var="img_left" anchorY="1" autoSize="true" width="300" height="300"/>
			  <Image skin="png.uiScript.img_bg" x="-88" y="133"/>
			  <Image skin="png.uiScript.人名下划线" x="328.5" y="260"/>
			  <Label text="人名" autoSize="none" x="298.5" y="229" style="二级框标题" size="24" var="txt_name" width="203" height="35" align="center" color="0xe6cd78"/>
			  <Label text="人名人名人名人名人名\n人名\n人名" autoSize="none" x="13" y="294" style="二级框标题" size="20" var="txt_content" width="760" height="92" align="center" multiline="true" wordWrap="true" color="0xFFFFFF"/>
			  <Image skin="png.uiScript.鼠标继续按钮" x="575" y="357"/>
			  <Label text="(5秒)" autoSize="none" x="686" y="355" style="二级框标题" size="18" var="txt_cd" width="85" height="28" align="left" multiline="true" wordWrap="true" color="0xFFFFFF"/>
			  <Box x="13" y="293" var="boxMask" width="760">
			    <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" width="760" height="82" var="mask0" x="0" y="0"/>
			  </Box>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="-62" y="204" width="883" height="194" fillColor="0xFF00FF" var="boxMouse"/>
			  <Button label="跳过全部剧情" x="745" style="按钮中黄" y="354" var="btn_skipAll" width="100"/>
			</View>;
       
      
      public var cover:GRect = null;
      
      public var img_right:Image = null;
      
      public var img_left:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_content:Label = null;
      
      public var txt_cd:Label = null;
      
      public var boxMask:Box = null;
      
      public var mask0:GRect = null;
      
      public var boxMouse:GRect = null;
      
      public var btn_skipAll:Button = null;
      
      public function DramaSayS3UI()
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
