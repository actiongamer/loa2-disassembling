package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class DungeonFlagBaseRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="71" height="105">
			  <Box x="0" y="-12" var="box_flag">
			    <Image skin="png.a5.comps.img_block" var="img_bottom" autoSize="true" anchorX="0.5" anchorY="1" scale="1" buttonMode="true" y="25"/>
			    <Box var="box_flagAndIcon">
			      <Image skin="png.a5.comps.img_block" var="img_icon" autoSize="false" width="60" height="60" anchorX="0.5" anchorY="1" scale="1" buttonMode="true"/>
			      <Image skin="png.a5.comps.img_block" var="img_flag" autoSize="true" width="50" height="60" anchorX="0.5" anchorY="1" buttonMode="true" y="10"/>
			    </Box>
			  </Box>
			</View>;
       
      
      public var box_flag:Box = null;
      
      public var img_bottom:Image = null;
      
      public var box_flagAndIcon:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_flag:Image = null;
      
      public function DungeonFlagBaseRenderUI()
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
