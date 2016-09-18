package game.ui.familyBosses.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HornorRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="506" height="40">
			  <Image skin="png.uiFamilyBossHornor.img_selected" var="img_selected"/>
			  <Image skin="png.a5.commonImgs.1ST" x="18" y="8" var="img_rank"/>
			  <Label text="普通说明" autoSize="none" x="103" y="12" style="普通说明" var="txt_name" width="122" height="20" align="center"/>
			  <Label text="1211" autoSize="none" x="257" y="12" style="普通说明" var="txt_count" align="center" width="73" height="20"/>
			  <Label text="普通说明" autoSize="none" x="20" y="12" style="普通说明" var="txt_rank"/>
			  <HornorRankRewardRender x="378" y="-1" runtime="game.ui.familyBosses.render.HornorRankRewardRenderUI"/>
			  <HornorRankRewardRender x="419" y="-1" runtime="game.ui.familyBosses.render.HornorRankRewardRenderUI"/>
			  <HornorRankRewardRender x="462" y="-1" runtime="game.ui.familyBosses.render.HornorRankRewardRenderUI"/>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var img_rank:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_count:Label = null;
      
      public var txt_rank:Label = null;
      
      public function HornorRankRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.HornorRankRewardRenderUI"] = HornorRankRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
