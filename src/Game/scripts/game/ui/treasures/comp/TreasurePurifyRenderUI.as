package game.ui.treasures.comp
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class TreasurePurifyRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="164" height="20">
			  <Label autoSize="none" x="0" y="2" width="66" height="18" text="护佑加成佑" var="txt_name" style="人名1不随品质变化" align="left"/>
			  <Box x="66" y="6" width="26" height="10">
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条2" x="2" y="2" var="txt_progress1"/>
			  </Box>
			  <Box x="93" y="6">
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条2" x="2" y="2" var="txt_progress2"/>
			  </Box>
			  <Box x="120" y="6">
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条2" x="2" y="2" var="txt_progress3"/>
			  </Box>
			  <Box x="147" y="6">
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条"/>
			    <Image skin="png.uiTreasure2.重铸 洗炼.进度条2" x="2" y="2" var="txt_progress4"/>
			  </Box>
			  <Label text="10" autoSize="none" x="66" y="-9" style="普通说明" var="txt_value"/>
			  <Image skin="png.uiTreasure2.刻印.上升箭头" x="175" y="0"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_progress1:Image = null;
      
      public var txt_progress2:Image = null;
      
      public var txt_progress3:Image = null;
      
      public var txt_progress4:Image = null;
      
      public var txt_value:Label = null;
      
      public function TreasurePurifyRenderUI()
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
