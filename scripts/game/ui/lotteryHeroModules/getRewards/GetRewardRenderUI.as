package game.ui.lotteryHeroModules.getRewards
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.RadioButton;
   import morn.core.components.Label;
   
   public class GetRewardRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="96" height="198">
			  <Box x="-15" y="-16" var="box_bg">
			    <Image skin="png.uiLuckyReward.style7_2.光1" var="img_selectBox"/>
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="39" y="40" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50"/>
			    <Image skin="png.comp.image" x="42" y="44" var="img_icon" width="42" height="42"/>
			    <RadioButton x="53" y="155" style="Radio普通" selected="false" var="btn_select"/>
			  </Box>
			  <Label text="name" stroke="0xffffff" var="txt_name" backgroundColor="0xcfbeaf" autoSize="none" x="-3" y="81" letterSpacing="1" width="100" height="40" align="center" style="随品质变化" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.comps.img_block" x="7" y="9" width="40" height="40" var="img_group" anchorX="0.5" anchorY="0.5" autoSize="true" visible="false"/>
			  <Label autoSize="none" x="31" y="0" bold="false" size="12" width="85" align="left" isHtml="true" style="普通说明" height="20" var="txt_group" visible="false"/>
			  <Label text="突破至下级需要2个相同英雄" stroke="0xffffff" var="txt_tupoNeed" backgroundColor="0xcfbeaf" autoSize="none" x="-1" y="160" letterSpacing="1" width="98" height="40" align="center" style="不足禁止红" multiline="true" wordWrap="true"/>
			  <Image skin="png.a5.commonImgs.img_buzhenIcon" x="8" y="13" var="img_using"/>
			  <Label text="12" autoSize="none" x="28" y="54" size="12" var="txt_num" letterSpacing="1" style="随品质变化" align="right" visible="false" width="44"/>
			</WealthRender>;
       
      
      public var box_bg:Box = null;
      
      public var img_selectBox:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var btn_select:RadioButton = null;
      
      public var txt_name:Label = null;
      
      public var img_group:Image = null;
      
      public var txt_group:Label = null;
      
      public var txt_tupoNeed:Label = null;
      
      public var img_using:Image = null;
      
      public var txt_num:Label = null;
      
      public function GetRewardRenderUI()
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
