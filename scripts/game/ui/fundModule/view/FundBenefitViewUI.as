package game.ui.fundModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import game.ui.fundModule.render.FundPelopleRenderUI;
   import game.ui.fundModule.render.FundRewardRenderUI;
   
   public class FundBenefitViewUI extends View
   {
      
      protected static var uiView:XML = <View width="717" height="403">
			  <Image skin="png.a5.comps.img_block" x="64" y="19" var="img_v2ad4" width="101" height="31"/>
			  <Image skin="png.a5.comps.img_block" x="263" y="-61" var="img_v2ad3" width="381" height="61"/>
			  <Image skin="png.a5.comps.img_block" x="276" y="-128" var="img_v2ad1" width="213" height="79"/>
			  <Image skin="png.uiFund.VIP" x="500" y="-91"/>
			  <ClipList value="3" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S14" x="559" y="-79"/>
			  <Image skin="png.a5.comps.img_block" x="579" y="-79" var="img_v2ad2" width="66" height="18"/>
			  <Image skin="png.a5.comps.img_block" x="-18" y="104" var="img_icon" width="264" height="299"/>
			  <List x="40" y="53" repeatX="4" width="149" height="52" spaceX="-1" var="list_allCount">
			    <FundPelopleRender x="0" y="0" name="render" runtime="game.ui.fundModule.render.FundPelopleRenderUI"/>
			  </List>
			  <Label text="即将激活" autoSize="none" x="64" y="112" style="普通说明" width="120" height="20" var="label_nextReward"/>
			  <List x="223" y="13" width="494" height="366" repeatY="4" spaceY="2" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="list_welfare">
			    <FundRewardRender name="render" runtime="game.ui.fundModule.render.FundRewardRenderUI"/>
			  </List>
			  <Box x="61" y="135" var="box_link" buttonMode="true" mouseChildren="false">
			    <Image skin="png.uiFund.前往箭头" x="85"/>
			    <Label text="我来加把劲吧" autoSize="none" style="加底标题" width="83" height="20" letterSpacing="1"/>
			  </Box>
			</View>;
       
      
      public var img_v2ad4:Image = null;
      
      public var img_v2ad3:Image = null;
      
      public var img_v2ad1:Image = null;
      
      public var img_v2ad2:Image = null;
      
      public var img_icon:Image = null;
      
      public var list_allCount:List = null;
      
      public var label_nextReward:Label = null;
      
      public var list_welfare:List = null;
      
      public var box_link:Box = null;
      
      public function FundBenefitViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fundModule.render.FundPelopleRenderUI"] = FundPelopleRenderUI;
         viewClassMap["game.ui.fundModule.render.FundRewardRenderUI"] = FundRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
