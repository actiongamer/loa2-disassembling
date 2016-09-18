package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class GPKghnpmRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="544" height="26">
			  <Label text="11" autoSize="none" x="10" y="4" style="普通说明" width="31" height="20" var="t0"/>
			  <Label text="普通说明" autoSize="none" x="56" y="4" style="普通说明" width="64" height="20" var="t1"/>
			  <Label text="普通说明" autoSize="none" x="130" y="4" style="普通说明" width="92" height="20" var="t2"/>
			  <Label text="普通说明" autoSize="none" x="218" y="4" style="普通说明" width="80" height="20" var="t3"/>
			  <Label text="普通说明" autoSize="none" x="309" y="4" style="普通说明" width="61" height="20" var="t4"/>
			  <Label text="普通说明" autoSize="none" x="385" y="4" style="普通说明" width="61" height="20" var="t5"/>
			  <Label text="普通说明" autoSize="none" x="448" y="4" style="普通说明" width="40" height="20" align="center" var="t6"/>
			  <Image skin="png.a5.commonImgs.1ST" x="4" y="1" var="img0"/>
			  <Label text="普通说明" autoSize="none" x="499" y="4" style="普通说明" width="40" height="20" align="center" var="t7"/>
			</View>;
       
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var t3:Label = null;
      
      public var t4:Label = null;
      
      public var t5:Label = null;
      
      public var t6:Label = null;
      
      public var img0:Image = null;
      
      public var t7:Label = null;
      
      public function GPKghnpmRenderUI()
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
