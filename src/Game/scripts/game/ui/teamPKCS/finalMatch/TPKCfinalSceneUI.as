package game.ui.teamPKCS.finalMatch
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TPKCfinalSceneUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400" left="0" right="0" top="0" bottom="0">
			  <Box x="-31" y="19" top="-20" centerX="0" var="box_bt">
			    <Image skin="png.uiTeamPKCS.final.img_title" x="4"/>
			    <Image skin="png.uiTeamPKCS.final.img_title_bg" y="127"/>
			    <Image skin="png.uiTeamPKCS.final.img_up0" x="241" y="126" var="btn_up1"/>
			    <Image skin="png.uiTeamPKCS.final.img_up0" x="16" y="126" var="btn_up0"/>
			    <Image skin="png.uiTeamPKCS.final.img_up0" x="465" y="126" var="btn_up2"/>
			    <Label text="晋级赛" autoSize="none" x="282" y="87" style="加底标题" width="146" height="33" align="center" size="19" var="titleTxt"/>
			    <Label text="\l999900252" autoSize="none" x="49" y="166" style="加底标题" width="146" height="23" align="center" size="15" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="\l999900253" autoSize="none" x="275" y="166" style="加底标题" width="146" height="23" align="center" size="15" mouseChildren="false" mouseEnabled="false"/>
			    <Label text="\l999900254" autoSize="none" x="497" y="166" style="加底标题" width="146" height="23" align="center" size="15" mouseChildren="false" mouseEnabled="false"/>
			  </Box>
			</View>;
       
      
      public var box_bt:Box = null;
      
      public var btn_up1:Image = null;
      
      public var btn_up0:Image = null;
      
      public var btn_up2:Image = null;
      
      public var titleTxt:Label = null;
      
      public function TPKCfinalSceneUI()
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
