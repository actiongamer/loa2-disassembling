package game.ui.pkCrossSer
{
   import morn.core.components.View;
   import morn.customs.components.Placeholder;
   
   public class PKCrossFinalPosUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Placeholder width="50" height="50" x="159" y="-191" var="pos0"/>
			  <Placeholder width="50" height="50" x="-95" y="-119" var="pos1"/>
			  <Placeholder width="50" height="50" x="234" y="230" var="pos2"/>
			  <Placeholder width="50" height="50" x="-81" y="572" var="pos6"/>
			  <Placeholder width="50" height="50" x="78" y="414" var="pos4"/>
			  <Placeholder width="50" height="50" x="-280" y="59" var="pos3"/>
			  <Placeholder width="50" height="50" x="-445" y="226" var="pos5"/>
			  <Placeholder width="50" height="50" x="-252" y="729" var="pos7"/>
			</View>;
       
      
      public var pos0:Placeholder = null;
      
      public var pos1:Placeholder = null;
      
      public var pos2:Placeholder = null;
      
      public var pos6:Placeholder = null;
      
      public var pos4:Placeholder = null;
      
      public var pos3:Placeholder = null;
      
      public var pos5:Placeholder = null;
      
      public var pos7:Placeholder = null;
      
      public function PKCrossFinalPosUI()
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
