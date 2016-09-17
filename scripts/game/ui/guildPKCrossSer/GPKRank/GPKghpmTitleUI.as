package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class GPKghpmTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="26">
			  <Label text="11" autoSize="none" x="8" y="5" style="升级后加底标题" width="31" height="20" var="t0"/>
			  <Label text="普通说明" autoSize="none" x="49" y="5" style="升级后加底标题" width="64" height="20" var="t1"/>
			  <Label text="普通说明" autoSize="none" x="128" y="5" style="升级后加底标题" width="92" height="20" var="t2"/>
			  <Label text="普通说明" autoSize="none" x="211" y="5" style="升级后加底标题" width="80" height="20" var="t3"/>
			  <Label text="普通说明" autoSize="none" x="306" y="5" style="升级后加底标题" width="61" height="20" var="t4"/>
			  <Label text="普通说明" autoSize="none" x="390" y="5" style="升级后加底标题" width="61" height="20" var="t5"/>
			  <Label text="普通说明" autoSize="none" x="453" y="5" style="升级后加底标题" width="40" height="20" align="center" var="t6"/>
			  <Label text="普通说明" autoSize="none" x="505" y="5" style="升级后加底标题" width="40" height="20" align="center" var="t7"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var t4:Label = null;
      
      public var t5:Label = null;
      
      public var t6:Label = null;
      
      public var t7:Label = null;
      
      public function GPKghpmTitleUI()
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
