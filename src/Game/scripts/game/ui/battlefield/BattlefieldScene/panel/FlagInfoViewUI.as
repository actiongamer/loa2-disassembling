package game.ui.battlefield.BattlefieldScene.panel
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class FlagInfoViewUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="40" mouseChildren="false" mouseEnabled="false">
			  <Image skin="png.uiBattlefieldScenes.battlefieldSceneModule.flag" x="-3" y="-1" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="上方战旗（红魔）" autoSize="left" x="33" y="1" style="重要提示黄" align="left" var="txt_resName" height="20" mouseEnabled="false" mouseChildren="false"/>
			  <Label autoSize="left" x="33" y="20" style="重要提示黄" align="left" var="txt_resStatus" height="20" text="刷新时间：05:22" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var txt_resName:Label = null;
      
      public var txt_resStatus:Label = null;
      
      public function FlagInfoViewUI()
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
