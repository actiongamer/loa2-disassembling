package game.ui.secretExplore
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class SETipsUI extends View
   {
      
      protected static var uiView:XML = <View width="330" height="237">
			  <Image skin="png.uiSecretExplore.img_tipbg" x="0" y="0"/>
			  <Label text="\l50700108 " stroke="0xffffff" mouseEnabled="false" var="txt_name" width="200" align="center" y="12" backgroundColor="0xcfbeaf" height="23" x="60" mouseChildren="false" style="二级框标题"/>
			  <SETipFace x="86" y="47" var="f0" runtime="game.ui.secretExplore.SETipFaceUI"/>
			  <SETipFace x="170" y="47" var="f1" runtime="game.ui.secretExplore.SETipFaceUI"/>
			  <SETipFace x="129" y="120" var="f3" runtime="game.ui.secretExplore.SETipFaceUI"/>
			  <SETipFace x="40" y="120" var="f2" runtime="game.ui.secretExplore.SETipFaceUI"/>
			  <SETipFace x="218" y="120" var="f4" runtime="game.ui.secretExplore.SETipFaceUI"/>
			  <Label text="1" stroke="0xffffff" mouseEnabled="false" var="txt_reward" width="240" align="center" y="202" backgroundColor="0xcfbeaf" height="27" x="43" mouseChildren="false" style="二级框标题"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var f0:game.ui.secretExplore.SETipFaceUI = null;
      
      public var f1:game.ui.secretExplore.SETipFaceUI = null;
      
      public var f3:game.ui.secretExplore.SETipFaceUI = null;
      
      public var f2:game.ui.secretExplore.SETipFaceUI = null;
      
      public var f4:game.ui.secretExplore.SETipFaceUI = null;
      
      public var txt_reward:Label = null;
      
      public function SETipsUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.secretExplore.SETipFaceUI"] = game.ui.secretExplore.SETipFaceUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
