package game.ui.teamPKCS.pre
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TPKCRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="264" height="36">
			  <Image skin="png.a5.commonImgs.rank.img_crown1" x="6" y="9" var="crown"/>
			  <Label text="1" autoSize="none" x="12" y="9" style="普通说明" width="22" height="20" var="t0"/>
			  <Label autoSize="none" x="43" y="2" style="普通说明" width="101" height="38" multiline="true" wordWrap="true" var="t1"/>
			  <Label text="1" autoSize="none" x="156" y="9" style="普通说明" height="20" var="t2"/>
			  <Label text="1" autoSize="none" x="208" y="9" style="普通说明" height="20" var="t3" width="53" align="center"/>
			</View>;
       
      
      public var crown:Image = null;
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
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
