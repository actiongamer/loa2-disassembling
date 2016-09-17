package game.ui.sevenDayModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class DayGiftRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="160" height="222">
			  <Image x="0" y="0" buttonMode="false" mouseEnabled="false" smoothing="true" var="img_gift"/>
			  <Image skin="png.a5.commonImgs.img_have" x="1" y="2" visible="false" var="have_got"/>
			  <Label text="重要提示橘黄" autoSize="none" x="0" y="167" style="重要提示橘黄" width="160" bold="true" size="13" var="gift_hint" buttonMode="true" mouseEnabled="true" mouseChildren="false" visible="true" align="center" multiline="true" wordWrap="true" language="ru" lgx="0,0,0,0,0,0,0,0" lgy="147,167,147,147,147,147,147,127"/>
			  <Label text="第一天" autoSize="none" x="60" y="189" style="普通说明" var="day_hint" mouseEnabled="true" buttonMode="true" mouseChildren="false" visible="true"/>
			</View>;
       
      
      public var img_gift:Image = null;
      
      public var have_got:Image = null;
      
      public var gift_hint:Label = null;
      
      public var day_hint:Label = null;
      
      public function DayGiftRenderUI()
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
