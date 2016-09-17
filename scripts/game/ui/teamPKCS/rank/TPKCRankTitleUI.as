package game.ui.teamPKCS.rank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class TPKCRankTitleUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="26">
			  <Label text="11" autoSize="none" x="7" y="5" style="升级后加底标题" height="20" var="t0"/>
			  <Label text="普通说明" autoSize="none" x="59" y="5" style="升级后加底标题" width="64" height="20" var="t1"/>
			  <Label text="普通说明" autoSize="none" x="199" y="5" style="升级后加底标题" width="92" height="20" var="t2"/>
			  <Label text="普通说明" autoSize="none" x="308" y="5" style="升级后加底标题" width="80" height="20" var="t3"/>
			  <Label text="普通说明" autoSize="none" x="399" y="5" style="升级后加底标题" width="61" height="20" var="t4"/>
			  <Label text="普通说明" autoSize="none" x="481" y="5" style="升级后加底标题" width="61" height="20" var="t5"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var t4:Label = null;
      
      public var t5:Label = null;
      
      public function TPKCRankTitleUI()
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
