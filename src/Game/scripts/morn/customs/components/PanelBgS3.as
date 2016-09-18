package morn.customs.components
{
   import morn.core.components.Image;
   
   public class PanelBgS3 extends PanelBg
   {
      
      public static const BOTTOM_1:int = 60;
      
      public static const BOTTOM_2:int = 11;
      
      protected static var uiXML:XML = <View width="255" height="123" sceneColor="0xffffff" layers="3,1,0,1,btnClose;5,1,0,1,titleName;6,1,0,0,第 6 层;2,1,0,1,img_rim" compId="9">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板三级" layer="2" left="-5" right="-5" top="-3" bottom="-2" var="img_rim" sizeGrid="63,40,63,40" x="-5" y="-3" width="265" height="128" compId="1"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底部黄光" layer="2" bottom="2" centerX="0" var="img_ligthBottom" compId="2"/>
			  <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" layer="2" sizeGrid="20,20,20,20" left="11" right="11" top="33" bottom="60" var="img_frame" compId="3"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.二级底板标题头底" layer="6" centerX="0" x="6.5" y="1" compId="4" var="img_lightTop"/>
			  <Image layer="5" var="img_titleName" y="2" anchorY="0.5" autoSize="true" centerX="0" style="二级框标题" x="87" compId="5"/>
			  <Label text="标题" autoSize="none" styleSkin="png.comp.label" y="2" layer="5" style="渐变3" centerX="0" width="163" height="22" mouseEnabled="false" align="center" var="txt_titleName" x="46" compId="6"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" layer="3" var="gDrag" left="0" right="0" height="36" x="17" y="-1" width="255" compId="7"/>
			  <Button skin="png.a5.btns.btn_closeS1" layer="3" stateNum="1" right="-7" var="btn_close" compId="8"/>
			</View>
		
		;
       
      
      public var img_ligthBottom:Image;
      
      public var img_frame:Image;
      
      public var img_lightTop:Image;
      
      public function PanelBgS3()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         createView(uiXML);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
      }
      
      public function get showLightBottom() : Boolean
      {
         return this.img_ligthBottom.visible;
      }
      
      public function set showLightBottom(param1:Boolean) : void
      {
         this.img_ligthBottom.visible = param1;
      }
      
      public function get showLightTop() : Boolean
      {
         return this.img_lightTop.visible;
      }
      
      public function set showLightTop(param1:Boolean) : void
      {
         this.img_lightTop.visible = param1;
      }
      
      public function set frameStyle(param1:int) : void
      {
         switch(int(param1) - 1)
         {
            case 0:
               img_frame.bottom = 60;
               break;
            case 1:
               img_frame.bottom = 11;
         }
      }
      
      public function set frameMargin(param1:String) : void
      {
         var _loc2_:Array = param1.split(",");
         img_frame.left = _loc2_[0];
         img_frame.top = _loc2_[1];
         img_frame.right = _loc2_[2];
         img_frame.bottom = _loc2_[3];
      }
      
      public function set frameVisible(param1:Boolean) : void
      {
         img_frame.visible = param1;
      }
   }
}
