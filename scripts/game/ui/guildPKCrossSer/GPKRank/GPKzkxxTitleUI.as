package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GPKzkxxTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="26">
			  <Image skin="png.a5.commonImgs.img_yellow" x="195" y="-2"/>
			  <Label text="普通说明" autoSize="none" x="227.5" y="5" style="升级后加底标题" width="83" height="20" var="t0" align="center" centerX="0"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public function GPKzkxxTitleUI()
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
