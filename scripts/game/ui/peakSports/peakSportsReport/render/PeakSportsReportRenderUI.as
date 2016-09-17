package game.ui.peakSports.peakSportsReport.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class PeakSportsReportRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="760" height="30">
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_renderBg1" x="380" y="15" anchorX="0.5" anchorY="0.5" var="img_bg"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_selectBox" x="0" y="0" name="selectBoxAll" mouseEnabled="false" mouseChildren="false"/>
			  <Label autoSize="none" x="54" y="7" style="普通说明" width="24" var="txt_rank" height="20" text="1" align="left"/>
			  <Label autoSize="none" x="114" y="7" style="普通说明" var="txt_name" text="张飞飞飞飞" width="82" height="20" mouseChildren="true" align="center"/>
			  <Label autoSize="none" x="232" y="7" style="普通说明" var="txt_server" text="SD100" width="95" height="20" align="center"/>
			  <Label autoSize="none" x="363" y="7" style="普通说明" var="txt_level" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="459" y="7" style="普通说明" var="txt_fightValue" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="555" y="7" style="普通说明" var="txt_killed" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="651" y="7" style="普通说明" var="txt_assisted" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="-1" y="5" style="渐变绿" var="imgResultTxt" text="胜利" width="50" height="20" mouseChildren="true" align="center" centerY="0"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_server:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_killed:Label = null;
      
      public var txt_assisted:Label = null;
      
      public var imgResultTxt:Label = null;
      
      public function PeakSportsReportRenderUI()
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
