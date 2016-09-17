package game.ui.militaryRankInfos.render
{
   import morn.core.components.View;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.icons.LotteryRenderS8UI;
   
   public class MilitaryRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="130" height="160">
			  <Box x="-6" y="-1" var="box_icon">
			    <Box x="71" y="83" var="box_floatIcon">
			      <Image skin="png.a5.comps.img_block" width="130" height="130" autoSize="true" anchorX="0.5" anchorY="0.5" var="img_icon" smoothing="true" buttonMode="true"/>
			    </Box>
			    <Image skin="png.a5.bgs.panelBgs.底板上小黑底框九宫格" x="6" y="16" width="130" height="130" sizeGrid="20,20,20,20" var="img_bg" alpha="0" buttonMode="true"/>
			    <Image skin="png.uiMilitaryRankInfo.img_title" x="-0.5"/>
			    <Label text="英雄徽章" x="8.5" y="5" width="125" height="25" align="center" style="加底标题" var="txt_name" size="13"/>
			  </Box>
			  <Label text="英雄徽章" x="-53.5" y="70" width="237" height="25" align="center" style="普通绿色" size="13" var="txt_addProp" mouseEnabled="false" mouseChildren="false"/>
			  <Box x="-44" y="140" var="box_cond" width="181" height="26">
			    <Label text="\l30400007" y="3" width="105" height="25" align="right" style="不足禁止红" size="13" var="txt_need" x="-8"/>
			    <LotteryRenderS8 x="100" var="render_cost" buttonMode="true" y="0" runtime="game.ui.commons.icons.LotteryRenderS8UI"/>
			  </Box>
			  <Label text="\l30400008" y="143" width="128" height="25" align="center" style="重要提示绿" size="13" var="txt_cond" x="1"/>
			</View>;
       
      
      public var box_icon:Box = null;
      
      public var box_floatIcon:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_addProp:Label = null;
      
      public var box_cond:Box = null;
      
      public var txt_need:Label = null;
      
      public var render_cost:LotteryRenderS8UI = null;
      
      public var txt_cond:Label = null;
      
      public function MilitaryRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.LotteryRenderS8UI"] = LotteryRenderS8UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
