package game.ui.teamPKCS.report
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class TPKCReportRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="433" height="34">
			  <Image skin="png.uiTeamPKCS.img_report_bg" x="0" y="0" width="433" height="34" var="img_bbg"/>
			  <Box x="1" y="8" var="box_con">
			    <Label text="\l999900287" autoSize="none" x="323" y="2" style="重要提示橘黄" var="txt_playback" height="18" align="left" underline="true"/>
			    <Label text="普通说明" autoSize="none" style="普通说明" height="20" var="txt_info"/>
			  </Box>
			  <Box var="box_title">
			    <Image skin="png.uiTeamPKCS.img_report_title"/>
			    <Label text="普通说明" autoSize="none" x="55" y="7" style="普通说明" height="20" var="t0"/>
			    <Label text="普通说明" autoSize="none" x="255" y="7" style="普通说明" height="20" var="t1"/>
			    <Label text="\l999900298" autoSize="none" x="196" y="4" style="渐变1" width="44" height="24" align="center"/>
			  </Box>
			</View>;
       
      
      public var img_bbg:Image = null;
      
      public var box_con:Box = null;
      
      public var txt_playback:Label = null;
      
      public var txt_info:Label = null;
      
      public var box_title:Box = null;
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public function TPKCReportRenderUI()
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
