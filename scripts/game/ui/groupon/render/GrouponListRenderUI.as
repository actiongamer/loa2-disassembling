package game.ui.groupon.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS3UI;
   
   public class GrouponListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="164" height="46">
			  <Button skin="png.uiGroupon.btn_label" x="0" y="-1" var="btn_activity"/>
			  <Label text="精通石火热开团" autoSize="none" x="46" y="6" style="渐变1" width="124" height="22" align="left" var="txt_name" mouseEnabled="false" mouseChildren="false" size="14" bold="false"/>
			  <Label text="精通石火热开团" autoSize="none" x="46" y="23" style="渐变1" width="124" height="22" align="left" var="txt_stauts" mouseEnabled="false" mouseChildren="false" size="14" bold="false"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-4" y="-5" sizeGrid="10,10,10,10" width="172" height="55" name="selectBoxAll" mouseEnabled="false" mouseChildren="false"/>
			  <WealthRenderS3 x="4" y="3" scale=".8" var="iconRender" runtime="game.ui.commons.icons.WealthRenderS3UI"/>
			</View>;
       
      
      public var btn_activity:Button = null;
      
      public var txt_name:Label = null;
      
      public var txt_stauts:Label = null;
      
      public var iconRender:WealthRenderS3UI = null;
      
      public function GrouponListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS3UI"] = WealthRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
