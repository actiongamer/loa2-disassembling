package game.ui.teamPKCS.invite
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class TPKIPosUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Placeholder width="50" height="50" x="-130" y="18" var="s3"/>
			  <Placeholder width="50" height="50" x="-12" y="121" var="s0"/>
			  <Placeholder width="50" height="50" x="197" y="87" var="s2"/>
			  <Placeholder width="50" height="50" x="113" y="21" var="s4"/>
			  <Placeholder width="50" height="50" x="-217" y="89" var="s1"/>
			</View>;
       
      
      public var s3:Placeholder = null;
      
      public var s0:Placeholder = null;
      
      public var s2:Placeholder = null;
      
      public var s4:Placeholder = null;
      
      public var s1:Placeholder = null;
      
      public function TPKIPosUI()
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
