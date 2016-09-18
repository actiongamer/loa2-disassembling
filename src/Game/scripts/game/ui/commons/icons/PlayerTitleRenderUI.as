package game.ui.commons.icons
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.Box;
   
   public class PlayerTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="285" height="75">
			  <Image skin="png.a5.commonImgs.img_NameBg_2" x="18.5" y="2" height="37"/>
			  <Label text="长江一号" x="41" y="10" width="213" height="50" var="txt_name" style="人名1不随品质变化" bold="true" align="center" size="15" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="41" y="21" anchorX="0.5" anchorY="0.5" var="img_group" autoSize="true" smoothing="true"/>
			  <Image skin="png.a5.comps.img_block" x="251" y="21" anchorX="0.5" anchorY="0.5" var="img_carrer" autoSize="true" smoothing="true"/>
			  <Box x="100" y="42" var="box_level" width="189" height="18">
			    <Label text="\l11300000" autoSize="none" height="30" width="44" align="left" style="普通说明" size="14" x="0" y="0"/>
			    <Label text="25" autoSize="none" height="29" x="42" width="164" align="left" style="普通说明" size="14" var="txt_level" y="0"/>
			  </Box>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var img_group:Image = null;
      
      public var img_carrer:Image = null;
      
      public var box_level:Box = null;
      
      public var txt_level:Label = null;
      
      public function PlayerTitleRenderUI()
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
