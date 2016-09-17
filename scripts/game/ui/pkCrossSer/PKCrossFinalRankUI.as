package game.ui.pkCrossSer
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS1UI;
   import morn.core.components.Tab;
   
   public class PKCrossFinalRankUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="326">
			  <Image skin="png.uiPKCrossSer.img_rank_bg" var="img_rank_bg" sizeGrid="10,10,10,10" width="272" height="326" x="0" y="0"/>
			  <Image skin="png.uiPKCrossSer.img_list_top" x="0" y="31"/>
			  <Label autoSize="none" x="5" y="35" style="普通说明" width="256" height="19" align="center" var="txt_info" text="1"/>
			  <Image skin="png.uiPKCrossSer.img_rank_line_5" y="76" x="-1"/>
			  <Image skin="png.uiPKCrossSer.img_rank_line_5" y="156" x="-1" var="img_line_down"/>
			  <Box y="148" var="left_dock" x="267">
			    <Button skin="png.uiPKCrossSer.btn_dock" stateNum="1" var="btn_left_dock"/>
			    <Image skin="png.uiPKCrossSer.img_dock" y="17" mouseEnabled="false" mouseChildren="false" var="img_dock_left" anchorX=".5" anchorY=".5" x="10"/>
			  </Box>
			  <List x="4" y="77" var="list_rank">
			    <PKCrossRankRender name="render" runtime="game.ui.pkCrossSer.PKCrossRankRenderUI"/>
			  </List>
			  <Label text="名次" autoSize="none" x="8" y="57" style="加底标题" var="t0"/>
			  <Label text="积分" autoSize="none" x="201" y="57" style="加底标题" width="66" height="19" var="t3" align="center"/>
			  <Label text="服务器" autoSize="none" x="138" y="57" style="加底标题" var="t2"/>
			  <Label text="名称" autoSize="none" x="46" y="57" style="加底标题" var="t1"/>
			  <Box x="72" y="285" var="box_rank_button">
			    <PageBarS1 x="7" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS1UI"/>
			    <Button skin="png.uiPKCrossSer.btn_next" x="102" y="1" stateNum="1" var="btn_next_more"/>
			    <Button skin="png.uiPKCrossSer.btn_next" y="1" stateNum="1" scaleX="-1" var="btn_prev_more"/>
			  </Box>
			  <Tab x="8" y="9" style="TAB暗红色" labels="\l998000966,\l998000967" selectedIndex="1" var="tab"/>
			  <Image x="211" y="7" width="42" height="26" var="img_myFlag"/>
			</View>;
       
      
      public var img_rank_bg:Image = null;
      
      public var txt_info:Label = null;
      
      public var img_line_down:Image = null;
      
      public var left_dock:Box = null;
      
      public var btn_left_dock:Button = null;
      
      public var img_dock_left:Image = null;
      
      public var list_rank:List = null;
      
      public var t0:Label = null;
      
      public var t3:Label = null;
      
      public var t2:Label = null;
      
      public var t1:Label = null;
      
      public var box_rank_button:Box = null;
      
      public var pageBarUI:PageBarS1UI = null;
      
      public var btn_next_more:Button = null;
      
      public var btn_prev_more:Button = null;
      
      public var tab:Tab = null;
      
      public var img_myFlag:Image = null;
      
      public function PKCrossFinalRankUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS1UI"] = PageBarS1UI;
         viewClassMap["game.ui.pkCrossSer.PKCrossRankRenderUI"] = PKCrossRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
