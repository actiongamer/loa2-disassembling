package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GPKzkxxRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="524" height="76">
			  <Image skin="png.uiGuildPKCrossSer.img_zkxx_bg" x="0" y="0"/>
			  <Image skin="png.comp.image" x="37" y="39" var="img_flag_bg" anchorX=".5" anchorY=".5" scaleX=".4" scaleY=".4" smoothing="true"/>
			  <Image skin="png.comp.image" x="38" y="30" anchorX=".5" anchorY=".5" var="img_flag_icon" scaleX=".4" scaleY=".4" smoothing="true"/>
			  <Image skin="png.uiGuildPKCrossSer.img_power1" x="0" y="0" var="img_power"/>
			  <Label text="普通说明\n普通说明" autoSize="none" x="88" y="18" style="普通说明" width="173" height="46" var="txt_info" leading="5"/>
			  <Label text="1" autoSize="none" x="412" y="11" style="技能名标题" width="100" height="20" align="right" var="txt_day"/>
			  <Label text="+1" autoSize="none" x="483" y="45" style="普通说明" width="34" height="20" var="txt_rep" align="right"/>
			  <Image skin="png.uiGuildPKCrossSer.img_rep" x="460" y="45"/>
			  <Box x="288" y="-18">
			    <Image skin="png.uiGuildPKCrossSer.img_zkxx_win" var="img_win"/>
			    <Label text="\l999900120" autoSize="none" y="37" style="渐变1" width="138" height="48" size="40" bold="true" align="center" var="rightwinTxt" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			</View>;
       
      
      public var img_flag_bg:Image = null;
      
      public var img_flag_icon:Image = null;
      
      public var img_power:Image = null;
      
      public var txt_info:Label = null;
      
      public var txt_day:Label = null;
      
      public var txt_rep:Label = null;
      
      public var img_win:Image = null;
      
      public var rightwinTxt:Label = null;
      
      public function GPKzkxxRenderUI()
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
