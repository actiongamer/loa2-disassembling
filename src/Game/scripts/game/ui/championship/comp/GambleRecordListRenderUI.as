package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class GambleRecordListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="700" height="30">
			  <Image skin="png.a5.commonImgs.公会排行-选中" x="-2" y="-1" sizeGrid="6,6,6,6" width="705" height="31" var="img_selected"/>
			  <Button label="\l50400404" x="547" y="3" style="按钮小黄" var="btn_see"/>
			  <Button label="\l50400405" x="625" y="3" style="按钮小蓝" var="btn_get"/>
			  <Label text="普通说明" autoSize="none" x="32" y="8" style="普通说明" width="403" height="18" var="txt_content"/>
			  <Label text="250" autoSize="none" x="397" y="7" style="普通说明" width="136" height="18" var="txt_reward" align="center"/>
			  <Image skin="png.a5.comps.img_block" x="5" y="4" width="22" height="22" var="img_title" visible="false"/>
			  <Label text="渐变1" autoSize="none" x="-19" y="4" style="渐变1" width="48" height="23" align="right" var="img_title_txt"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var btn_see:Button = null;
      
      public var btn_get:Button = null;
      
      public var txt_content:Label = null;
      
      public var txt_reward:Label = null;
      
      public var img_title:Image = null;
      
      public var img_title_txt:Label = null;
      
      public function GambleRecordListRenderUI()
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
