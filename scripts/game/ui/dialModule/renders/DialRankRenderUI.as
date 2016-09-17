package game.ui.dialModule.renders
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class DialRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="625" height="68">
			  <Image skin="png.a5.comps.img_block" x="64" y="22" anchorX="0.5" anchorY="0.5" var="img_crown"/>
			  <Label autoSize="none" x="11" y="36" style="普通说明" size="14" var="txt_name" align="center" width="106" height="20"/>
			  <Label autoSize="none" x="132" y="24" style="普通说明" size="18" var="txt_score" width="82" height="22" align="center"/>
			  <Label autoSize="none" x="21" y="9" style="渐变1" var="txt_rank" width="85" height="22" align="center"/>
			  <Image skin="png.uiDialModules.img_line" x="-4" y="64"/>
			  <Box x="247" y="2" var="box_normal" width="198" height="61">
			    <List repeatX="3" spaceX="9" var="list_normal">
			      <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			    </List>
			  </Box>
			  <Box x="513" y="2" var="box_super" width="129" height="61">
			    <List var="list_super" repeatX="2" spaceX="9">
			      <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			    </List>
			  </Box>
			</View>;
       
      
      public var img_crown:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_score:Label = null;
      
      public var txt_rank:Label = null;
      
      public var box_normal:Box = null;
      
      public var list_normal:List = null;
      
      public var box_super:Box = null;
      
      public var list_super:List = null;
      
      public function DialRankRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
