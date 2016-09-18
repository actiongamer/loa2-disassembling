package game.ui.guildPKCrossSer
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class GPKChallengeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="489" height="145">
			  <Image skin="png.uiGuildPKCrossSer.img_challenge4" x="0" y="0"/>
			  <Image skin="png.comp.image" x="84" y="71" var="img_flag_bg" anchorX=".5" anchorY=".5" scaleX=".8" scaleY=".8" smoothing="true"/>
			  <Image skin="png.comp.image" x="85" y="62" anchorX=".5" anchorY=".5" var="img_flag_icon" scaleX=".8" scaleY=".8" smoothing="true"/>
			  <Button skin="png.uiGuildPKCrossSer.btn_challenge3" x="388" y="45" stateNum="1" var="btn_start"/>
			  <Image skin="png.uiGuildPKCrossSer.img_challenge2" x="6" y="111"/>
			  <Label text="普通说明" autoSize="none" x="188" y="22" style="普通说明" width="194" height="118" var="txt_me_info" leading="5"/>
			  <Label text="升级后加底标题" autoSize="none" x="-10" y="117" style="升级后加底标题" width="191" height="20" align="center" var="txt_me_name"/>
			  <Box x="-11" y="2">
			    <Image skin="png.uiGuildPKCrossSer.img_power1" x="12" var="img_power"/>
			    <Label y="24" style="渐变2" width="50" height="20" rotation="-45" mouseEnabled="false" mouseChildren="false" size="14" var="powerTxt" align="center" x="0"/>
			  </Box>
			</View>;
       
      
      public var img_flag_bg:Image = null;
      
      public var img_flag_icon:Image = null;
      
      public var btn_start:Button = null;
      
      public var txt_me_info:Label = null;
      
      public var txt_me_name:Label = null;
      
      public var img_power:Image = null;
      
      public var powerTxt:Label = null;
      
      public function GPKChallengeRenderUI()
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
