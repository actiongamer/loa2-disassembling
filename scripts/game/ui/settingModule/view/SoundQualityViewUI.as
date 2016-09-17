package game.ui.settingModule.view
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.RadioGroup;
   import morn.core.components.RadioButton;
   import morn.customs.components.HSliderS2;
   
   public class SoundQualityViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Label text="音质" autoSize="none" x="-232" y="409" style="加底标题" var="soundQualityL" visible="false"/>
			  <Label text="主音量" autoSize="none" x="17" y="49" style="加底标题" var="mainVolumeL"/>
			  <Label text="背景音乐" autoSize="none" x="126" y="167" style="加底标题" var="backVolumeL" width="204" height="20"/>
			  <Label text="战斗音乐" autoSize="none" x="126" y="220" style="加底标题" var="battleVolumeL" width="192" height="20"/>
			  <Label text="系统语音" autoSize="none" x="-269" y="502" style="加底标题" var="systemVolumeL" visible="false"/>
			  <Label text="界面音效" autoSize="none" x="126" y="273" style="加底标题" var="uiVolumeL" width="189" height="20"/>
			  <Label text="对话语音" autoSize="none" x="-274" y="461" style="加底标题" var="dialogVolumeL" visible="false"/>
			  <Image skin="png.a5.commonImgs.线" x="-8" y="112" width="665"/>
			  <Label text="快捷设置" autoSize="none" x="15" y="5" style="加底标题" var="simpleSetting"/>
			  <Label text="详细设置" autoSize="none" x="15" y="135" style="加底标题" var="detailSetting"/>
			  <RadioGroup x="-185" y="406" var="soundQuality" selectedIndex="2" visible="false">
			    <RadioButton label="低" style="Radio普通" selected="false" name="item0" skin="png.a5.btns.radio_S1" var="soundQualityLow"/>
			    <RadioButton label="中" x="70" style="Radio普通" selected="false" name="item1" skin="png.a5.btns.radio_S1" var="soundQualityMid"/>
			    <RadioButton label="高" x="140" style="Radio普通" selected="false" name="item2" skin="png.a5.btns.radio_S1" var="soundQualityHigh"/>
			  </RadioGroup>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="128" y="52" width="466" height="14" var="mainVolume" showLabel="false" buttonMode="true"/>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="131" y="196" width="180" height="10" var="backVolume" showLabel="false" buttonMode="true"/>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="131" y="250" width="180" height="10" var="battleVolume" showLabel="false" buttonMode="true"/>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="-199" y="506" width="180" height="10" var="systemVolume" showLabel="false" buttonMode="true" visible="false"/>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="131" y="304" width="180" height="10" var="uiVolume" showLabel="false" buttonMode="true"/>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="-203" y="465" width="180" height="10" var="dialogVolume" showLabel="false" buttonMode="true" visible="false"/>
			  <Label text="普通说明" autoSize="none" x="602" y="48" style="普通说明" var="mainVolValue"/>
			  <Label text="普通说明" autoSize="none" x="-18" y="461" style="普通说明" var="dialogVolValue" visible="false"/>
			  <Label text="普通说明" autoSize="none" x="316" y="300" style="普通说明" var="uiVolValue"/>
			  <Label text="普通说明" autoSize="none" x="-14" y="504" style="普通说明" var="systemVolValue" visible="false"/>
			  <Label text="普通说明" autoSize="none" x="316" y="246" style="普通说明" var="battleVolValue"/>
			  <Label text="普通说明" autoSize="none" x="316" y="192" style="普通说明" var="backVolValue"/>
			</View>;
       
      
      public var soundQualityL:Label = null;
      
      public var mainVolumeL:Label = null;
      
      public var backVolumeL:Label = null;
      
      public var battleVolumeL:Label = null;
      
      public var systemVolumeL:Label = null;
      
      public var uiVolumeL:Label = null;
      
      public var dialogVolumeL:Label = null;
      
      public var simpleSetting:Label = null;
      
      public var detailSetting:Label = null;
      
      public var soundQuality:RadioGroup = null;
      
      public var soundQualityLow:RadioButton = null;
      
      public var soundQualityMid:RadioButton = null;
      
      public var soundQualityHigh:RadioButton = null;
      
      public var mainVolume:HSliderS2 = null;
      
      public var backVolume:HSliderS2 = null;
      
      public var battleVolume:HSliderS2 = null;
      
      public var systemVolume:HSliderS2 = null;
      
      public var uiVolume:HSliderS2 = null;
      
      public var dialogVolume:HSliderS2 = null;
      
      public var mainVolValue:Label = null;
      
      public var dialogVolValue:Label = null;
      
      public var uiVolValue:Label = null;
      
      public var systemVolValue:Label = null;
      
      public var battleVolValue:Label = null;
      
      public var backVolValue:Label = null;
      
      public function SoundQualityViewUI()
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
