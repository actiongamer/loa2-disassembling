package game.ui.teamGuajiScenes.changeChallenges
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuajiChangeChallengeRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="72" height="82">
			  <Image skin="png.uiTeamGuajis.图标02" x="2" y="0" var="img_icon" centerX="0"/>
			  <Label text="困难3" autoSize="none" x="-54" y="54" style="渐变绿" width="180" height="32" align="center" var="txt_name" centerX="0"/>
			  <Label text="(未解锁)" autoSize="none" x="-13" y="76" style="不足禁止红" var="txt_lock" centerX="0" width="98" height="20" align="center"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lock:Label = null;
      
      public function GuajiChangeChallengeRenderUI()
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
