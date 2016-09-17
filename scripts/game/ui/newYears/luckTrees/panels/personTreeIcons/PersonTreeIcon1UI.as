package game.ui.newYears.luckTrees.panels.personTreeIcons
{
   import morn.core.components.View;
   import game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI;
   
   public class PersonTreeIcon1UI extends View
   {
      
      protected static var uiView:XML = <View width="260" height="250">
			  <PersonTreeRewardIcon x="107.5" y="1" var="render1" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="209" y="89" var="render2" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="36" y="27" var="render3" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="218" y="164" var="render6" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="152" y="134" var="render4" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="31" y="87" var="render5" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="160" y="207" var="render7" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="31" y="203" var="render8" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="180" y="33" var="render9" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="99" y="76" var="render10" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="-15" y="145" var="render11" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			  <PersonTreeRewardIcon x="91" y="163" var="render12" runtime="game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"/>
			</View>;
       
      
      public var render1:PersonTreeRewardIconUI = null;
      
      public var render2:PersonTreeRewardIconUI = null;
      
      public var render3:PersonTreeRewardIconUI = null;
      
      public var render6:PersonTreeRewardIconUI = null;
      
      public var render4:PersonTreeRewardIconUI = null;
      
      public var render5:PersonTreeRewardIconUI = null;
      
      public var render7:PersonTreeRewardIconUI = null;
      
      public var render8:PersonTreeRewardIconUI = null;
      
      public var render9:PersonTreeRewardIconUI = null;
      
      public var render10:PersonTreeRewardIconUI = null;
      
      public var render11:PersonTreeRewardIconUI = null;
      
      public var render12:PersonTreeRewardIconUI = null;
      
      public function PersonTreeIcon1UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.luckTrees.renders.PersonTreeRewardIconUI"] = PersonTreeRewardIconUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
