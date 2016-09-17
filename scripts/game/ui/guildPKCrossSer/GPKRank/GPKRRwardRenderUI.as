package game.ui.guildPKCrossSer.GPKRank
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GPKRRwardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="537" height="56">
			  <Image skin="png.a5.commonImgs.rank.img_crown1" x="11" y="17" var="img_rank"/>
			  <List x="58" y="3" repeatX="5" var="item0">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <List x="338" y="3" repeatX="4" var="item1">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="11-21" autoSize="none" x="1" y="18" style="普通说明" width="48" height="20" align="center" var="txt_rank"/>
			  <Image skin="png.uiGuildPKCrossSer.img_line_reward" x="14" y="55"/>
			</View>;
       
      
      public var img_rank:Image = null;
      
      public var item0:List = null;
      
      public var item1:List = null;
      
      public var txt_rank:Label = null;
      
      public function GPKRRwardRenderUI()
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
