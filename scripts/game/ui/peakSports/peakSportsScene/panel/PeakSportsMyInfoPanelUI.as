package game.ui.peakSports.peakSportsScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class PeakSportsMyInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="185" height="144" mouseEnabled="false">
			  <Image skin="png.uiPeakSports.img_situationBg" x="0" y="0" width="185" height="144"/>
			  <Label text="\l50500066" autoSize="none" x="0" y="5" style="加底标题" width="185" align="center" size="14" centerX="0"/>
			  <Label text="击杀数：" autoSize="none" x="33.5" y="27" style="普通说明" align="left" height="20" var="txt_killed"/>
			  <Label text="助攻数：" autoSize="none" x="33.5" y="47" style="普通说明" align="left" height="20" var="txt_assisted"/>
			  <Label text="阵营杀人王：" autoSize="none" x="33.5" y="65" style="普通说明" align="left" var="txt_gathered" width="150" multiline="true" wordWrap="true" isHtml="true"/>
			  <Button label="战报信息" x="40" y="145" style="按钮中绿" var="btn_info" centerX="0"/>
			</View>;
       
      
      public var txt_killed:Label = null;
      
      public var txt_assisted:Label = null;
      
      public var txt_gathered:Label = null;
      
      public var btn_info:Button = null;
      
      public function PeakSportsMyInfoPanelUI()
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
