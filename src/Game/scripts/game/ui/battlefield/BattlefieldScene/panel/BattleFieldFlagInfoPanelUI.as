package game.ui.battlefield.BattlefieldScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class BattleFieldFlagInfoPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="40" mouseChildren="false" mouseEnabled="false">
			  <FlagInfoView x="86" var="left_flagInfo" mouseChildren="false" mouseEnabled="false" y="0" runtime="game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI"/>
			  <FlagInfoView x="257" y="-1" var="right_flagInfo" mouseChildren="false" mouseEnabled="false" runtime="game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI"/>
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.img_monster" x="425" y="5"/>
			  <Label text="\l50500182" autoSize="left" x="460" y="1" style="重要提示黄" align="left" height="20" mouseEnabled="false" mouseChildren="false"/>
			  <Label autoSize="left" x="460" y="20" style="重要提示黄" align="left" var="txt_monsterCnt" height="20" text="刷新时间：05:22" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var left_flagInfo:game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI = null;
      
      public var right_flagInfo:game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI = null;
      
      public var txt_monsterCnt:Label = null;
      
      public function BattleFieldFlagInfoPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI"] = game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
