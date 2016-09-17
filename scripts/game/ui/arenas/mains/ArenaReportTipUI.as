package game.ui.arenas.mains
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class ArenaReportTipUI extends View
   {
      
      protected static var uiView:XML = <View width="456" height="105">
			  <Box var="box_content">
			    <Image skin="png.a5.commonImgs.分割透明底" x="0" y="0" var="img_Bg" sizeGrid="160,10,160,10"/>
			    <List x="-1" y="6" repeatY="3" spaceY="1" var="list">
			      <ArenaReportTipRender name="render" runtime="game.ui.arenas.mains.ArenaReportTipRenderUI"/>
			    </List>
			    <Label text="点击查看详情" autoSize="left" x="305" y="73" style="技能名标题" var="txt_more" width="123" height="20" align="right"/>
			  </Box>
			  <Box x="432" y="0" var="box_show">
			    <Button skin="png.a5.commonImgs.btn_small" stateNum="1" var="btn_show"/>
			    <Image skin="png.a5.commonImgs.img_suofang" x="12" y="11" anchorX="0.5" anchorY="0.5" var="img_arrow_show"/>
			  </Box>
			</View>;
       
      
      public var box_content:Box = null;
      
      public var img_Bg:Image = null;
      
      public var list:List = null;
      
      public var txt_more:Label = null;
      
      public var box_show:Box = null;
      
      public var btn_show:Button = null;
      
      public var img_arrow_show:Image = null;
      
      public function ArenaReportTipUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.arenas.mains.ArenaReportTipRenderUI"] = ArenaReportTipRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
