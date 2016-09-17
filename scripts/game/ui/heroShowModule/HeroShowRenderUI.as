package game.ui.heroShowModule
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.roleInfos.tupos.RoleTupoNeedRenderUI;
   
   public class HeroShowRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="143" height="202" style="重要提示橘黄" buttonMode="true">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" x="0" y="0" sizeGrid="4,4,4,4" width="143" height="203"/>
			  <Button label="获得英雄" x="27" y="86" style="按钮中绿" var="btn_goToReward"/>
			  <Box y="0" var="box_info" x="0" mouseChildren="true">
			    <Image skin="png.a5.comps.img_block" autoSize="true" width="143" height="203" var="img_icon" x="0" y="0"/>
			    <Image skin="png.a5.comps.img_block" autoSize="false" width="143" height="203" var="img_bg"/>
			    <Image skin="png.uiHeroShow.img_bg_001" x="2" y="2"/>
			    <Label text="等级：199" autoSize="right" x="8" y="3" width="66" height="24" var="txt_level" style="重要提示橘黄" mouseEnabled="false" mouseChildren="false" lgx="12" lgy="3" language="en" align="right"/>
			    <Label text="进阶：5" autoSize="right" x="70" y="3" width="68" height="24" var="txt_jieshu" style="重要提示橘黄" mouseEnabled="false" mouseChildren="false" lgx="70,70" lgy="3" language="en" align="right"/>
			    <Label text="普罗米修斯" x="1.5" y="183" width="140" var="txt_name" style="随品质变化" align="center" mouseEnabled="false" mouseChildren="false"/>
			    <Label text="普罗米修斯" x="1.5" y="163" width="140" var="txt_nick" style="随品质变化" align="center" mouseEnabled="false" mouseChildren="false"/>
			    <Image skin="png.a5.commonImgs.img_buzhenIcon" var="img_shangzhen" y="6"/>
			    <Image skin="png.a5.commonImgs.img_buzhen2Icon" var="img_reinforcements" y="6"/>
			    <Image skin="png.a5.comps.img_block" x="12" y="189" anchorX="0.5" anchorY="1" autoSize="true" width="22" height="22" var="img_career" mouseEnabled="false"/>
			    <Image skin="png.a5.commonImgs.新获得2" x="90" var="img_new"/>
			    <Image skin="png.uiHeroShow.img_mask2" var="img_mask" width="141" height="201" x="1" y="1"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.img_crown" x="-4" y="-2" var="img_crown"/>
			  <List repeatX="4" var="list_need" x="15" y="130" spaceX="-26">
			    <RoleTupoNeedRender name="render" scale="0.40" runtime="game.ui.roleInfos.tupos.RoleTupoNeedRenderUI"/>
			  </List>
			</View>;
       
      
      public var btn_goToReward:Button = null;
      
      public var box_info:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_bg:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_jieshu:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_nick:Label = null;
      
      public var img_shangzhen:Image = null;
      
      public var img_reinforcements:Image = null;
      
      public var img_career:Image = null;
      
      public var img_new:Image = null;
      
      public var img_mask:Image = null;
      
      public var img_crown:Image = null;
      
      public var list_need:List = null;
      
      public function HeroShowRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleInfos.tupos.RoleTupoNeedRenderUI"] = RoleTupoNeedRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
