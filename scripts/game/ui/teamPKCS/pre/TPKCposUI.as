package game.ui.teamPKCS.pre
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class TPKCposUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Placeholder width="50" height="50" x="-358" y="53" var="s1"/>
			  <Placeholder width="50" height="50" x="-428" y="172" var="s2"/>
			  <Placeholder width="50" height="50" x="-490" y="281" var="s3"/>
			  <Placeholder width="50" height="50" x="-532" y="384" var="s4"/>
			  <Placeholder width="50" height="50" x="53" y="253" var="f1"/>
			  <Placeholder width="50" height="50" x="336" y="53" var="e1"/>
			  <Placeholder width="50" height="50" x="395" y="172" var="e2"/>
			  <Placeholder width="50" height="50" x="435" y="281" var="e3"/>
			  <Placeholder width="50" height="50" x="496" y="384" var="e4"/>
			  <Placeholder width="50" height="50" x="280" y="246" var="e0"/>
			  <Placeholder width="50" height="50" x="-100" y="251" var="f0"/>
			  <Placeholder width="50" height="50" x="-306" y="239" var="s0"/>
			</View>;
       
      
      public var s1:Placeholder = null;
      
      public var s2:Placeholder = null;
      
      public var s3:Placeholder = null;
      
      public var s4:Placeholder = null;
      
      public var f1:Placeholder = null;
      
      public var e1:Placeholder = null;
      
      public var e2:Placeholder = null;
      
      public var e3:Placeholder = null;
      
      public var e4:Placeholder = null;
      
      public var e0:Placeholder = null;
      
      public var f0:Placeholder = null;
      
      public var s0:Placeholder = null;
      
      public function TPKCposUI()
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
