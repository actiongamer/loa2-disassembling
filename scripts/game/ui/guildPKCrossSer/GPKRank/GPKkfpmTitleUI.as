package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GPKkfpmTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="26">
			  <Label text="11" autoSize="none" x="0" y="4" style="升级后加底标题" width="51" height="20" var="t0"/>
			  <Label text="普通说明" autoSize="none" x="52" y="4" style="升级后加底标题" width="75" height="20" var="t1"/>
			  <Label text="普通说明" autoSize="none" x="126" y="4" style="升级后加底标题" width="102" height="20" var="t2"/>
			  <Label text="普通说明" autoSize="none" x="228" y="4" style="升级后加底标题" width="94" height="20" var="t3"/>
			  <Label text="普通说明" autoSize="none" x="323" y="4" style="升级后加底标题" height="20" var="t4" width="81"/>
			  <Label text="普通说明" autoSize="none" x="405" y="4" style="升级后加底标题" width="64" height="20" var="t5"/>
			  <Label text="普通说明" autoSize="none" x="469" y="4" style="升级后加底标题" width="75" height="20" align="center" var="t6"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var t4:Label = null;
      
      public var t5:Label = null;
      
      public var t6:Label = null;
      
      public function GPKkfpmTitleUI()
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
