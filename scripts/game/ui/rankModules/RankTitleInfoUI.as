package game.ui.rankModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class RankTitleInfoUI extends View
   {
      
      protected static var uiView:XML = <View width="545" height="30">
			  <Label autoSize="center" x="22" y="5" style="技能名标题" var="txt_head_1" align="center"/>
			  <Label autoSize="left" x="127" y="5" style="技能名标题" var="txt_head_2" align="center"/>
			  <Label autoSize="center" x="251" y="5" style="技能名标题" var="txt_head_3" align="center"/>
			  <Label autoSize="center" x="363" y="5" style="技能名标题" var="txt_head_4" align="center"/>
			  <Label autoSize="center" x="466" y="5" style="技能名标题" var="txt_head_5" align="center"/>
			</View>;
       
      
      public var txt_head_1:Label = null;
      
      public var txt_head_2:Label = null;
      
      public var txt_head_3:Label = null;
      
      public var txt_head_4:Label = null;
      
      public var txt_head_5:Label = null;
      
      public function RankTitleInfoUI()
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
