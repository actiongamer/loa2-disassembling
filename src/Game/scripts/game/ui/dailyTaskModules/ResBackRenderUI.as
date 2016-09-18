package game.ui.dailyTaskModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class ResBackRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="282" height="118" name="render">
			  <Image skin="png.uiDailyTask.img_bg0" x="0" y="0" var="img_bg0"/>
			  <Image skin="png.uiDailyTask.img_icon_buttom" x="18" y="21" var="img_icon_buttom"/>
			  <Button label="\l109000022" x="191" style="按钮中蓝" y="85" var="btn_diamond" labelMargin="16"/>
			  <Label autoSize="none" x="95" y="33" style="普通说明" var="txt_info_1" multiline="true" text="说明"/>
			  <Button label="\l109000021" x="101" y="85" style="按钮中绿" var="btn_gold" labelMargin="12"/>
			  <Label text="渐变1&#xD;渐变1" x="4" y="84" style="渐变1" width="104" height="40" align="center" var="label_0" size="16" wordWrap="true" multiline="true" leading="-5"/>
			  <Image skin="png.comp.image" x="108" y="91" var="img_icon_gold" scale="0.7" width="23" height="23" smoothing="true" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.comp.image" x="198" y="91" var="img_icon_diamond" scale="0.7" width="23" height="23" smoothing="true" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.comp.image" x="19" y="22" width="75" height="64" var="img_func"/>
			  <Label text="普通绿色" autoSize="none" x="200" y="13" style="普通绿色" var="txt_prog"/>
			  <Label autoSize="none" x="100" y="13" style="普通说明" var="txt_title" multiline="true" text="标题"/>
			  <Image skin="png.comp.image" width="23" height="23" var="img_icon_1" mouseChildren="false" mouseEnabled="false" language="en" lgx="193,163" lgy="30,30"/>
			  <Image skin="png.comp.image" width="23" height="23" var="img_icon_2" mouseChildren="false" mouseEnabled="false" lgx="193,163" lgy="56,56" language="en"/>
			  <Label autoSize="none" x="95" y="57" style="普通说明" var="txt_info_2" multiline="true" text="说明"/>
			  <Label autoSize="none" style="普通说明" var="txt_count_1" multiline="true" text="说明" language="en" lgx="221,191" lgy="33,33"/>
			  <Label autoSize="none" style="普通说明" var="txt_count_2" multiline="true" text="说明" lgx="221,191" lgy="57,57" language="en"/>
			  <Image skin="png.uiDailyTask.img_back" x="152" y="33" var="img_back" visible="false"/>
			</View>;
       
      
      public var img_bg0:Image = null;
      
      public var img_icon_buttom:Image = null;
      
      public var btn_diamond:Button = null;
      
      public var txt_info_1:Label = null;
      
      public var btn_gold:Button = null;
      
      public var label_0:Label = null;
      
      public var img_icon_gold:Image = null;
      
      public var img_icon_diamond:Image = null;
      
      public var img_func:Image = null;
      
      public var txt_prog:Label = null;
      
      public var txt_title:Label = null;
      
      public var img_icon_1:Image = null;
      
      public var img_icon_2:Image = null;
      
      public var txt_info_2:Label = null;
      
      public var txt_count_1:Label = null;
      
      public var txt_count_2:Label = null;
      
      public var img_back:Image = null;
      
      public function ResBackRenderUI()
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
