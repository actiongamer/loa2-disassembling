package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GPKChallenRewardUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="402" height="438">
			  <PanelBgS3 x="0" y="0" width="402" height="438" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.comp.image" x="15" y="35" width="372" height="332" var="img_bg"/>
			  <Image skin="png.uiGuildPKCrossSer.img_c_loss_bg" x="24" y="204"/>
			  <Image skin="png.uiGuildPKCrossSer.img_c_select" x="15" y="37" var="img_select"/>
			  <Image skin="png.uiGuildPKCrossSer.img_c_win_bg" x="23.5" y="44"/>
			  <Label text="必给" autoSize="none" x="27" y="91" style="普通说明" width="72" height="20" align="right" var="txt0" multiline="true" wordWrap="true"/>
			  <List x="111" y="76" repeatX="5" var="item0">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Image skin="png.uiGuildPKCrossSer.img_c_line" x="33" y="135"/>
			  <List x="111" y="145" repeatX="5" var="item1">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="随机给予一种" autoSize="none" x="21" y="161" style="普通说明" width="78" align="right" var="txt1" multiline="true" wordWrap="true"/>
			  <Label text="必给" autoSize="none" x="20" y="256" style="普通说明" width="79" height="20" align="right" var="txt2" multiline="true" wordWrap="true"/>
			  <List x="111" y="241" repeatX="5" var="item2">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Image skin="png.uiGuildPKCrossSer.img_c_line" x="37" y="301"/>
			  <List x="111" y="310" repeatX="5" var="item3">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="随机给予一种" autoSize="none" x="21" y="325" style="普通说明" width="78" align="right" var="txt3" multiline="true" wordWrap="true"/>
			  <Label text="加底标题" autoSize="none" x="41.5" y="45" style="加底标题" var="txt_win" width="339" height="20" align="center"/>
			  <Label text="加底标题" autoSize="none" x="37" y="207" style="加底标题" var="txt_loss" width="348" height="20" align="center"/>
			  <Label text="必给" autoSize="none" x="23" y="388" style="普通说明" height="20" align="center" var="txt_tip" centerX="0" width="356" multiline="true" wordWrap="true"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_select:Image = null;
      
      public var txt0:Label = null;
      
      public var item0:List = null;
      
      public var item1:List = null;
      
      public var txt1:Label = null;
      
      public var txt2:Label = null;
      
      public var item2:List = null;
      
      public var item3:List = null;
      
      public var txt3:Label = null;
      
      public var txt_win:Label = null;
      
      public var txt_loss:Label = null;
      
      public var txt_tip:Label = null;
      
      public function GPKChallenRewardUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
