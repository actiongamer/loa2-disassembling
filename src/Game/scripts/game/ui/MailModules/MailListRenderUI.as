package game.ui.MailModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS3UI;
   import morn.core.components.Image;
   
   public class MailListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="352" height="66" mouseChildren="false">
			  <Label text="剩余3天" autoSize="none" x="228" y="37" var="txtRestDay" width="116" height="23" align="right" color="0xffffff" font="SSZH" size="12"/>
			  <Label autoSize="none" x="66" y="9" var="txtTitle" width="286" height="29" align="left" color="0xffffff" font="SSZH" size="14" text="恭喜入围恭喜入围恭喜入围恭喜入围恭喜入围" lgsize="14,14,14,14,14,14,14,12"/>
			  <WealthRenderS3 x="4" y="5" scale="1.1" var="iconReward" mouseEnabled="false" mouseChildren="false" toolTip="0" runtime="game.ui.commons.icons.WealthRenderS3UI"/>
			  <Image skin="png.a5.commonImgs.新获得" x="317" y="1" var="imgNew"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" var="imgMailframe" sizeGrid="6,6,6,6" x="4" y="5" scale="1.1"/>
			  <Image skin="png.uiMail.已读邮件" x="8" y="9" smoothing="true" scale="0.75" var="imgRead"/>
			  <Box name="render" x="0" y="64">
			    <Image skin="png.uiMail.邮件之间分割线"/>
			  </Box>
			  <Image skin="png.uiMail.鼠标滑过" x="0" y="0" name="selectBoxAll" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiMail.别针" x="120" var="imgFujian" y="35" language="en" lgx="150,120" lgy="35,35"/>
			  <Label autoSize="none" y="35" var="txtMailKind" height="22" align="left" color="0xffffff" font="SSZH" size="12" text="系统" style="人名2" x="66"/>
			</View>;
       
      
      public var txtRestDay:Label = null;
      
      public var txtTitle:Label = null;
      
      public var iconReward:WealthRenderS3UI = null;
      
      public var imgNew:Image = null;
      
      public var imgMailframe:Image = null;
      
      public var imgRead:Image = null;
      
      public var imgFujian:Image = null;
      
      public var txtMailKind:Label = null;
      
      public function MailListRenderUI()
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
