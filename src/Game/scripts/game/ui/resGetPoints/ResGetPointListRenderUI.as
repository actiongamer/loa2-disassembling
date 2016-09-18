package game.ui.resGetPoints
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ResGetPointListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="338" height="58">
			  <Image skin="png.comp.image" x="33" var="img_icon" width="48" height="48" anchorX="0.5" anchorY="0.5" autoSize="false" y="30" smoothing="true"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_name" align="left" x="63" y="4" backgroundColor="0xcfbeaf" size="14" height="21" style="小标题"/>
			  <Button label="立即前往" stateNum="1" buttonMode="true" labelColors="0xeac472,0xe1dfd6,0xada99b" labelSize="13" x="232" y="11" var="btn_enter" sizeGrid="53,15,53,15" style="按钮中绿"/>
			  <Label stroke="0xffffff" mouseEnabled="false" var="txt_desc" width="165" align="left" x="63" y="23" backgroundColor="0xcfbeaf" style="普通说明" wordWrap="true" multiline="true" text="副本扫荡可获得英雄碎"/>
			  <Image skin="png.a5.commonImgs.获取途径切换技能分割线" x="8" y="54" top="0"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var btn_enter:Button = null;
      
      public var txt_desc:Label = null;
      
      public function ResGetPointListRenderUI()
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
