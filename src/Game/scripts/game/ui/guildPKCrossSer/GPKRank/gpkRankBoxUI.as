package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class gpkRankBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="90" height="60">
			  <Button skin="png.a5.commonImgs.btn_reward2" x="14" y="3" stateNum="1" var="btn_box"/>
			  <Label text="排名奖励" autoSize="none" x="3" y="34" style="渐变1" width="81" height="18" align="center" var="txt_title" size="12" mouseEnabled="false" mouseChildren="false" selectable="false"/>
			</View>;
       
      
      public var btn_box:Button = null;
      
      public var txt_title:Label = null;
      
      public function gpkRankBoxUI()
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
