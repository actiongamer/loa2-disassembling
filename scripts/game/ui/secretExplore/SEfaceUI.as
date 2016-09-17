package game.ui.secretExplore
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.ProgressBar;
   import morn.core.components.Box;
   
   public class SEfaceUI extends View
   {
      
      protected static var uiView:XML = <View width="64" height="64" var="progress_hp">
			  <Image skin="png.uiSecretExplore.img_fb" x="0" y="0" var="img_bg"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS6_2" x="1" y="1" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="56" height="56"/>
			  <Label text="1" stroke="0xffffff" mouseEnabled="false" var="txt_name" width="95" align="center" y="-19" backgroundColor="0xcfbeaf" height="18" x="-14" mouseChildren="false" style="普通说明"/>
			  <Label text="1" stroke="0xffffff" mouseEnabled="false" var="txt_pow" width="95" align="center" y="44" backgroundColor="0xcfbeaf" height="18" x="-14" mouseChildren="false" style="普通说明"/>
			  <Button skin="png.uiSecretExplore.btn_fight" x="37" y="-60" stateNum="1" var="btn_fight"/>
			  <Button skin="png.uiSecretExplore.btn_help" x="-3" y="-60" stateNum="1" var="btn_help"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S3" x="-3" y="68" var="hpbar"/>
			  <Image skin="png.uiSecretExplore.img_buff" x="6" y="7" var="img_buff" visible="false"/>
			  <Box x="-6" y="-4" var="img_kill">
			    <Image skin="png.uiSecretExplore.img_kill"/>
			    <Label stroke="0xffffff" mouseEnabled="false" width="121" align="center" backgroundColor="0xcfbeaf" x="-23" mouseChildren="false" style="渐变红" rotation="-22" text="\l50700201" y="36" height="29"/>
			  </Box>
			</View>;
       
      
      public var progress_hp:View = null;
      
      public var img_bg:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_pow:Label = null;
      
      public var btn_fight:Button = null;
      
      public var btn_help:Button = null;
      
      public var hpbar:ProgressBar = null;
      
      public var img_buff:Image = null;
      
      public var img_kill:Box = null;
      
      public function SEfaceUI()
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
