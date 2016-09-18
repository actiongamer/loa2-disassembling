package game.ui.battlefield.BattlefieldReport.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldReportRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="760" height="30">
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_renderBg1" x="380" y="15" anchorX="0.5" anchorY="0.5" var="img_bg"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_selectBox" x="0" y="0" name="selectBoxAll" mouseEnabled="false" mouseChildren="false"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldReportModule.img_win" x="23" y="17" anchorX="0.5" anchorY="0.5" var="img_result" width="37" height="19"/>
			  <Label autoSize="none" x="54" y="7" style="普通说明" width="24" var="txt_rank" height="20" text="1" align="left"/>
			  <Label autoSize="none" x="96" y="7" style="普通说明" var="txt_name" text="张飞飞飞飞" width="82" height="20" mouseChildren="true" align="center"/>
			  <Label autoSize="none" x="168" y="7" style="普通说明" var="txt_server" text="SD100" width="95" height="20" align="center"/>
			  <Label autoSize="none" x="260" y="7" style="普通说明" var="txt_level" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="330" y="7" style="普通说明" var="txt_fightValue" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="400" y="7" style="普通说明" var="txt_gathered" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="469" y="7" style="普通说明" var="txt_killed" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="541" y="7" style="普通说明" var="txt_assisted" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="611" y="7" style="普通说明" var="txt_honor" text="100" width="60" height="20" align="center"/>
			  <Label autoSize="none" x="684" y="7" style="普通说明" var="txt_score" text="100" width="60" height="20" align="center"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_result:Image = null;
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_server:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var txt_gathered:Label = null;
      
      public var txt_killed:Label = null;
      
      public var txt_assisted:Label = null;
      
      public var txt_honor:Label = null;
      
      public var txt_score:Label = null;
      
      public function BattlefieldReportRenderUI()
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
