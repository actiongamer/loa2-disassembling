package game.ui.battlefield.BattlefieldTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldMapInfoRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="344" height="129">
			  <Image skin="png.a5.comps.img_block" x="0" y="-1" var="img_bg"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_mapInfoBg" x="207" y="108" width="203" height="49"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_mapInfoBg" x="207" y="68"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_mapInfoBg" x="207" y="32"/>
			  <Image skin="png.uiBattlefields.battlefieldTeamModule.img_miniMapBg" x="-4" y="-5"/>
			  <Image skin="png.a5.comps.img_block" x="103" y="88" width="213" height="181" anchorX="0.5" anchorY="0.5" var="img_miniMap" autoSize="true"/>
			  <Label autoSize="none" x="214" y="39" style="普通说明" width="193" align="left" height="20" text="战场模式：" var="txt_playerNums"/>
			  <Label text="持续时间：" autoSize="none" x="214" y="79" style="普通说明" width="197" align="left" height="20" var="txt_playTime"/>
			  <Label text="胜利条件：优先采集到1000个水晶的阵营获胜" autoSize="none" x="214" y="119" style="普通说明" width="199" align="left" height="114" var="txt_winCondition" wordWrap="true"/>
			  <Label autoSize="none" x="214" y="5" style="渐变1" width="193" align="center" height="22" text="战场模式：" var="txt_battlefieldName"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_miniMap:Image = null;
      
      public var txt_playerNums:Label = null;
      
      public var txt_playTime:Label = null;
      
      public var txt_winCondition:Label = null;
      
      public var txt_battlefieldName:Label = null;
      
      public function BattlefieldMapInfoRenderUI()
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
