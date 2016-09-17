package game.ui.rankModules
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class RankTitle7CellUI extends View
   {
      
      protected static var uiView:XML = <View width="545" height="30">
			  <Label autoSize="center" x="14" y="5" style="加底标题" var="txt_head0" align="center"/>
			  <Label autoSize="left" x="90" y="5" style="加底标题" var="txt_head1" align="center"/>
			  <Label autoSize="center" x="171" y="5" style="加底标题" var="txt_head2" align="center"/>
			  <Label autoSize="center" x="252" y="5" style="加底标题" var="txt_head3" align="center"/>
			  <Label autoSize="center" x="333" y="5" style="加底标题" var="txt_head4" align="center"/>
			  <Label autoSize="center" x="414" y="5" style="加底标题" var="txt_head5" align="center"/>
			  <Label autoSize="center" x="495" y="5" style="加底标题" var="txt_head6" align="center"/>
			</View>;
       
      
      public var txt_head0:Label = null;
      
      public var txt_head1:Label = null;
      
      public var txt_head2:Label = null;
      
      public var txt_head3:Label = null;
      
      public var txt_head4:Label = null;
      
      public var txt_head5:Label = null;
      
      public var txt_head6:Label = null;
      
      public function RankTitle7CellUI()
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
