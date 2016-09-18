package game.ui.battlefield.BattlefieldRankReward
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI;
   
   public class BattlefieldRankRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="460" height="555">
			  <PanelBgS3 x="1" y="3" width="454" height="546"/>
			  <Image skin="png.a5.comps.img_block" x="15" y="39" var="img_bg"/>
			  <Image skin="png.uiBattlefields.battlefieldRankRewardModule.img_titleBg" x="21" y="37" width="417" height="30"/>
			  <Button label="\l10000012" x="187" y="492" style="按钮中绿" var="btn_confirm"/>
			  <Label text="\l50500135" autoSize="none" x="3" y="522" style="普通说明" width="450" align="center" font="Microsoft YaHei" height="22"/>
			  <Label autoSize="none" x="124" y="43" style="普通说明" width="113" align="right" font="Microsoft YaHei" height="22" text="\l50400106" var="txt_rank"/>
			  <Label text="未上榜" autoSize="none" x="243" y="43" style="普通说明" width="169" align="left" var="txt_myRank" font="Microsoft YaHei" height="22"/>
			  <List x="15" y="65" repeatY="3" var="list_ranks" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="423" height="426">
			    <BattlefieldRankRewardRender name="render" x="0" y="0" runtime="game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var btn_confirm:Button = null;
      
      public var txt_rank:Label = null;
      
      public var txt_myRank:Label = null;
      
      public var list_ranks:List = null;
      
      public function BattlefieldRankRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battlefield.BattlefieldRankReward.render.BattlefieldRankRewardRenderUI"] = BattlefieldRankRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
