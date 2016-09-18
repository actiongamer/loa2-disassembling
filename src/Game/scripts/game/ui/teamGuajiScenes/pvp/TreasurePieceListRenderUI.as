package game.ui.teamGuajiScenes.pvp
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRender60X60UI;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TreasurePieceListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="354" height="90">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5" x="0" y="0" width="354" height="90" sizeGrid="20,20,20,20"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5Selected" x="-2" y="-3" width="359" height="94" sizeGrid="20,20,20,20" var="img_selected"/>
			  <WealthRender60X60 x="9" y="15" var="pieceRender" centerY="0" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  <Label text="人名1不随品\n人名1不随品" autoSize="left" x="80" y="4" style="人名1不随品质变化" align="left" var="txt_name" width="135" height="37" multiline="true" wordWrap="true"/>
			  <Label text="人名1不随品质变化人名1不随品质变化人名1不随品质变化人名1不随品质变化" autoSize="left" x="79" y="38" style="普通说明" align="left" width="182" height="56" multiline="true" wordWrap="true" var="txt_des" leading="0"/>
			  <Button label="\l41300241" x="264" y="49" style="按钮中绿" var="btn_compose"/>
			  <Button label="\l41300240" x="264" y="15" style="按钮中黄" var="btn_rob"/>
			  <Image skin="png.uiTeamGuajis.当前所在层" x="-5" y="-5" mouseEnabled="false" mouseChildren="false" var="img_crtFloor"/>
			  <Label text="（100/10）" autoSize="left" x="155" y="4" style="人名1不随品质变化" align="right" var="txt_haveCnt" width="107"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var pieceRender:WealthRender60X60UI = null;
      
      public var txt_name:Label = null;
      
      public var txt_des:Label = null;
      
      public var btn_compose:Button = null;
      
      public var btn_rob:Button = null;
      
      public var img_crtFloor:Image = null;
      
      public var txt_haveCnt:Label = null;
      
      public function TreasurePieceListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
