package game.ui.guildPKCrossSer.GPKRank
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   
   public class GPKRankRewardUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="506" height="500">
			  <PanelBgS3 x="0" y="0" width="583" height="500" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.comp.image" x="12" y="35" width="560" height="421" var="img_bg"/>
			  <List x="25" y="114" var="list_item" repeatY="6">
			    <GPKRRwardRender x="0" y="0" name="render" runtime="game.ui.guildPKCrossSer.GPKRank.GPKRRwardRenderUI"/>
			  </List>
			  <Label text="升级后加底标题" autoSize="none" x="33" y="94" style="升级后加底标题" var="t0"/>
			  <Label text="升级后加底标题" autoSize="none" x="86" y="94" style="升级后加底标题" var="t1" width="247" height="20" align="center"/>
			  <Label text="升级后加底标题" autoSize="none" x="366" y="94" style="升级后加底标题" var="t2" width="197" height="20" align="center"/>
			  <Label text="普通说明" autoSize="none" x="29" y="48" style="普通说明" width="219" height="44" var="txt0"/>
			  <Label text="普通说明" autoSize="none" x="256" y="48" style="普通说明" width="311" height="44" var="txt1"/>
			  <Label text="普通说明" autoSize="none" x="23" y="463" style="普通说明" width="535" var="txt2" multiline="true" wordWrap="true" align="center"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_item:List = null;
      
      public var t0:Label = null;
      
      public var t1:Label = null;
      
      public var t2:Label = null;
      
      public var txt0:Label = null;
      
      public var txt1:Label = null;
      
      public var txt2:Label = null;
      
      public function GPKRankRewardUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildPKCrossSer.GPKRank.GPKRRwardRenderUI"] = GPKRRwardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
