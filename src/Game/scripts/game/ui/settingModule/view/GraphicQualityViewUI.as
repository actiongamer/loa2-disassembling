package game.ui.settingModule.view
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.ComboBox;
   import morn.core.components.RadioGroup;
   import morn.core.components.RadioButton;
   import morn.customs.components.HSliderS2;
   
   public class GraphicQualityViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Label text="游戏画质" x="43" y="33" style="加底标题" var="gameQuality"/>
			  <ComboBox x="689" y="173" style="Combobox普通" width="181" height="25" sizeGrid="4,4,60,4" var="resoRatio" labels="1280*960,800*600,1024*768,1280*720,1440*900,1920*1080" visible="false"/>
			  <Label text="分辨率" autoSize="none" x="634" y="175" style="加底标题" var="resoRatioL" visible="false"/>
			  <Label text="界面动画" autoSize="none" x="626" y="220" style="加底标题" var="animeQualityL" visible="false"/>
			  <Label text="同屏人数" autoSize="none" x="16" y="145" style="加底标题" var="peopleNumL"/>
			  <Label text="抗锯齿" autoSize="none" x="16" y="205" style="加底标题" var="antiAliasL"/>
			  <Label text="其他玩家" autoSize="none" x="16" y="259" style="加底标题" var="otherPlayersL"/>
			  <Label text="濒死泛光" autoSize="none" x="684" y="142" style="加底标题" var="deathFlashL" visible="false"/>
			  <Label text="场景特效" autoSize="none" x="320" y="145" style="加底标题" var="sceneSpecEffectL"/>
			  <Label text="他人特效" autoSize="none" x="320" y="205" style="加底标题" var="otherSpecEffectL"/>
			  <Label text="他人称号" autoSize="none" x="671" y="263" style="加底标题" align="right" var="otherTitleL" visible="false"/>
			  <Label text="NPC" autoSize="none" x="320" y="259" style="加底标题" width="52" height="19" align="left" var="npcDisplayL"/>
			  <RadioGroup x="693" y="218" selectedIndex="1" var="animeQuality" space="35" visible="false">
			    <RadioButton label="低" skin="png.a5.btns.radio_S1" style="Radio普通" name="item0" x="0" y="-0.25" var="animeQualityLow"/>
			    <RadioButton label="中" skin="png.a5.btns.radio_S1" x="70" style="Radio普通" name="item1" y="-0.25" var="animeQualityMid"/>
			    <RadioButton label="高" skin="png.a5.btns.radio_S1" x="140" style="Radio普通" name="item2" y="-0.25" var="animeQualityHigh"/>
			  </RadioGroup>
			  <RadioGroup x="16" y="228" selectedIndex="0" var="antiAlias">
			    <RadioButton label="关" skin="png.a5.btns.radio_S1" x="70" style="Radio普通" selected="false" y="-0.5" name="item1" var="antiAliasN"/>
			    <RadioButton label="开" skin="png.a5.btns.radio_S1" style="Radio普通" selected="false" y="-0.5" name="item0" var="antiAliasY"/>
			  </RadioGroup>
			  <RadioGroup x="16" y="281" selectedIndex="0" var="otherPlayers">
			    <RadioButton label="隐藏" x="70" style="Radio普通" name="item1" skin="png.a5.btns.radio_S1" var="otherPlayersN" y="0"/>
			    <RadioButton label="显示" style="Radio普通" selected="false" name="item0" skin="png.a5.btns.radio_S1" var="otherPlayersY"/>
			  </RadioGroup>
			  <RadioGroup x="320" y="281" var="npcDisplay" selectedIndex="0">
			    <RadioButton label="隐藏（不推荐）" x="69" style="Radio普通" selected="false" y="-0.5" skin="png.a5.btns.radio_S1" name="item1" var="npcDisplayN"/>
			    <RadioButton label="显示" style="Radio普通" selected="false" y="-0.5" skin="png.a5.btns.radio_S1" name="item0" var="npcDisplayY"/>
			  </RadioGroup>
			  <Label text="流畅" x="106" y="54.5" style="加底标题" var="smooth"/>
			  <Label text="均衡" x="336" y="54.5" style="加底标题" var="balanced"/>
			  <Label text="高画质" x="564" y="54.5" style="加底标题" var="high"/>
			  <Image skin="png.a5.commonImgs.线" x="-8" y="92" width="665"/>
			  <Label text="快捷设置" autoSize="none" x="15" y="5" style="加底标题" var="simpleSetting"/>
			  <Label text="详细设置" autoSize="none" x="16" y="114" style="加底标题" width="399" height="19" var="detailSetting"/>
			  <RadioGroup x="16" y="175" selectedIndex="1" var="peopleNum" space="35">
			    <RadioButton label="5" skin="png.a5.btns.radio_S1" style="Radio普通" name="item0" x="0" y="-0.25"/>
			    <RadioButton label="15" skin="png.a5.btns.radio_S1" x="70" style="Radio普通" name="item1" y="-0.25"/>
			    <RadioButton label="30" skin="png.a5.btns.radio_S1" x="140" style="Radio普通" name="item2" y="-0.25"/>
			  </RadioGroup>
			  <RadioGroup x="754" y="141" selectedIndex="0" var="deathFlash" visible="false">
			    <RadioButton label="关" skin="png.a5.btns.radio_S1" x="69" style="Radio普通" selected="false" y="-0.5" name="item1" var="deathFlashN"/>
			    <RadioButton label="开" skin="png.a5.btns.radio_S1" style="Radio普通" selected="false" y="-0.5" name="item0" var="deathFlashY"/>
			  </RadioGroup>
			  <RadioGroup x="320" y="175" selectedIndex="0" var="sceneSpecEffect">
			    <RadioButton label="关" skin="png.a5.btns.radio_S1" x="69" style="Radio普通" selected="false" y="-0.5" name="item1" var="sceneSpecEffectN"/>
			    <RadioButton label="开" skin="png.a5.btns.radio_S1" style="Radio普通" selected="false" y="-0.5" name="item0" var="sceneSpecEffectY"/>
			  </RadioGroup>
			  <RadioGroup x="320" y="228" selectedIndex="0" var="otherSpecEffect">
			    <RadioButton label="关" skin="png.a5.btns.radio_S1" x="69" style="Radio普通" selected="false" y="-0.5" name="item1" var="otherSpecEffectN"/>
			    <RadioButton label="开" skin="png.a5.btns.radio_S1" style="Radio普通" selected="false" y="-0.5" name="item0" var="otherSpecEffectY"/>
			  </RadioGroup>
			  <RadioGroup x="741" y="262" selectedIndex="0" var="otherTitle" visible="false">
			    <RadioButton label="关" skin="png.a5.btns.radio_S1" x="69" style="Radio普通" selected="false" y="-0.5" name="item1" var="otherTitleN"/>
			    <RadioButton label="开" skin="png.a5.btns.radio_S1" style="Radio普通" selected="false" y="-0.5" name="item0" var="otherTitleY"/>
			  </RadioGroup>
			  <HSliderS2 skin="png.compCustoms.hsliderS2" x="110" y="34" min="0" max="2" value="0" tick="1" showLabel="false" var="presetSetting" buttonMode="true"/>
			</View>;
       
      
      public var gameQuality:Label = null;
      
      public var resoRatio:ComboBox = null;
      
      public var resoRatioL:Label = null;
      
      public var animeQualityL:Label = null;
      
      public var peopleNumL:Label = null;
      
      public var antiAliasL:Label = null;
      
      public var otherPlayersL:Label = null;
      
      public var deathFlashL:Label = null;
      
      public var sceneSpecEffectL:Label = null;
      
      public var otherSpecEffectL:Label = null;
      
      public var otherTitleL:Label = null;
      
      public var npcDisplayL:Label = null;
      
      public var animeQuality:RadioGroup = null;
      
      public var animeQualityLow:RadioButton = null;
      
      public var animeQualityMid:RadioButton = null;
      
      public var animeQualityHigh:RadioButton = null;
      
      public var antiAlias:RadioGroup = null;
      
      public var antiAliasN:RadioButton = null;
      
      public var antiAliasY:RadioButton = null;
      
      public var otherPlayers:RadioGroup = null;
      
      public var otherPlayersN:RadioButton = null;
      
      public var otherPlayersY:RadioButton = null;
      
      public var npcDisplay:RadioGroup = null;
      
      public var npcDisplayN:RadioButton = null;
      
      public var npcDisplayY:RadioButton = null;
      
      public var smooth:Label = null;
      
      public var balanced:Label = null;
      
      public var high:Label = null;
      
      public var simpleSetting:Label = null;
      
      public var detailSetting:Label = null;
      
      public var peopleNum:RadioGroup = null;
      
      public var deathFlash:RadioGroup = null;
      
      public var deathFlashN:RadioButton = null;
      
      public var deathFlashY:RadioButton = null;
      
      public var sceneSpecEffect:RadioGroup = null;
      
      public var sceneSpecEffectN:RadioButton = null;
      
      public var sceneSpecEffectY:RadioButton = null;
      
      public var otherSpecEffect:RadioGroup = null;
      
      public var otherSpecEffectN:RadioButton = null;
      
      public var otherSpecEffectY:RadioButton = null;
      
      public var otherTitle:RadioGroup = null;
      
      public var otherTitleN:RadioButton = null;
      
      public var otherTitleY:RadioButton = null;
      
      public var presetSetting:HSliderS2 = null;
      
      public function GraphicQualityViewUI()
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
