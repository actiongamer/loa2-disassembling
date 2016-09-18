package game.ui.TencentModule.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class TencentTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="164" height="46">
			  <Button skin="png.uiTencent.btn_label" x="0" y="-1" var="btn_activity"/>
			  <Label text="渐变1" autoSize="none" x="-12" y="13" style="渐变1" width="193" height="22" align="center" var="txt_name" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-4" y="-5" sizeGrid="10,10,10,10" width="172" height="55" name="selectBoxAll" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var btn_activity:Button = null;
      
      public var txt_name:Label = null;
      
      public function TencentTitleRenderUI()
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
