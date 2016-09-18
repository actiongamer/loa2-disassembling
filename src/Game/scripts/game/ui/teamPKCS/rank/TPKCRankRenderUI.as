package game.ui.teamPKCS.rank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class TPKCRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="29">
			  <Label text="11" autoSize="none" x="10" y="6" style="普通说明" width="31" height="20" var="t0"/>
			  <Label text="普通说明" autoSize="none" x="59" y="6" style="普通说明" height="20" var="t1"/>
			  <Label text="普通说明" autoSize="none" x="200" y="6" style="普通说明" width="92" height="20" var="t2"/>
			  <Label text="普通说明" autoSize="none" x="310" y="6" style="普通说明" width="80" height="20" var="t3"/>
			  <Label text="普通说明" autoSize="none" x="400" y="6" style="普通说明" width="61" height="20" var="t4"/>
			  <Label text="普通说明" autoSize="none" x="485" y="6" style="普通说明" height="20" var="t5"/>
			  <Image skin="png.a5.commonImgs.1ST" x="4" y="3" var="img0"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var t4:Label = null;
      
      public var t5:Label = null;
      
      public var img0:Image = null;
      
      public function TPKCRankRenderUI()
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
