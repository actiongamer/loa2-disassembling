package game.ui.guildPKCrossSer
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class GPKSkillRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="332" height="30">
			  <Label text="1" autoSize="none" x="8" y="7" style="普通说明" width="48" height="20" align="center" var="b0"/>
			  <Label text="普通说明" x="56" y="7" style="普通说明" width="101" height="20" autoSize="none" align="center" var="b1"/>
			  <Label text="普通说明" autoSize="none" x="149" y="7" style="普通说明" width="86" height="20" align="center" var="b2"/>
			  <Label text="普通说明" autoSize="none" x="236" y="7" style="普通说明" width="83" height="20" align="center" var="b3"/>
			  <Image skin="png.comp.image" x="13" y="5" var="p0"/>
			</View>;
       
      
      public var b0:Label = null;
      
      public var b1:Label = null;
      
      public var b2:Label = null;
      
      public var b3:Label = null;
      
      public var p0:Image = null;
      
      public function GPKSkillRankRenderUI()
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
