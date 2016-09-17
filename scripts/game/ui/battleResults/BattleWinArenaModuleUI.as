package game.ui.battleResults
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.PlayerRenderS3UI;
   
   public class BattleWinArenaModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1400" height="800">
			  <BattleBtnsRender var="box_btns" x="628" y="655" runtime="game.ui.battleResults.BattleBtnsRenderUI"/>
			  <Box x="473" y="328" var="p_loss">
			    <Image skin="png.uiAreanResults.winArenaModule.img_lossBg" var="img_lossBg" centerX=".5"/>
			    <Box x="162" y="82" var="box_loss">
			      <Image skin="png.uiAreanResults.winArenaModule.img_lossLogo" var="img_lossLogo"/>
			      <Label text="姓名:" autoSize="left" x="293" y="3" width="336" style="普通说明" size="27" height="43" var="txt_lossName"/>
			      <Label text="排名:" autoSize="left" x="294" y="40" width="462" style="普通说明" size="27" height="43" var="txt_lossRank"/>
			      <Box x="566" y="40" var="box_rankDown">
			        <Image skin="png.uiAreanResults.winArenaModule.img_down" var="img_down" y="11"/>
			        <Label text="排名:" autoSize="left" x="19" width="317" style="不足禁止红" size="27" height="43" var="txt_downRank"/>
			      </Box>
			    </Box>
			    <List x="155" y="194" repeatX="5" spaceX="11" var="list_lossTeam">
			      <PlayerRenderS3 name="render" runtime="game.ui.commons.icons.PlayerRenderS3UI"/>
			    </List>
			  </Box>
			  <Box x="0" y="76" var="p_win">
			    <Image skin="png.uiAreanResults.winArenaModule.img_winBg" var="img_winBg" centerX="0.5"/>
			    <Box x="544" y="88" var="box_win">
			      <Label text="姓名:" autoSize="left" width="337" style="普通说明" size="27" height="43" var="txt_winName"/>
			      <Label text="排名:" autoSize="left" x="1" y="36" width="317" style="普通说明" size="27" height="43" var="txt_winRank"/>
			      <Box x="204" y="36" var="box_rankUp">
			        <Image skin="png.uiAreanResults.winArenaModule.img_up" y="10"/>
			        <Label text="排名:" autoSize="left" x="21" width="317" style="普通绿色" size="27" height="43" var="txt_upedRank"/>
			      </Box>
			    </Box>
			    <Image skin="png.uiAreanResults.winArenaModule.img_winLogo" var="img_winLogo" x="362" y="126" anchorX="0.5" anchorY="0.5"/>
			    <List x="289" y="197" repeatX="5" spaceX="11" var="list_winTeam">
			      <PlayerRenderS3 name="render" runtime="game.ui.commons.icons.PlayerRenderS3UI"/>
			    </List>
			  </Box>
			</PopModuleView>;
       
      
      public var box_btns:game.ui.battleResults.BattleBtnsRenderUI = null;
      
      public var p_loss:Box = null;
      
      public var img_lossBg:Image = null;
      
      public var box_loss:Box = null;
      
      public var img_lossLogo:Image = null;
      
      public var txt_lossName:Label = null;
      
      public var txt_lossRank:Label = null;
      
      public var box_rankDown:Box = null;
      
      public var img_down:Image = null;
      
      public var txt_downRank:Label = null;
      
      public var list_lossTeam:List = null;
      
      public var p_win:Box = null;
      
      public var img_winBg:Image = null;
      
      public var box_win:Box = null;
      
      public var txt_winName:Label = null;
      
      public var txt_winRank:Label = null;
      
      public var box_rankUp:Box = null;
      
      public var txt_upedRank:Label = null;
      
      public var img_winLogo:Image = null;
      
      public var list_winTeam:List = null;
      
      public function BattleWinArenaModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.battleResults.BattleBtnsRenderUI"] = game.ui.battleResults.BattleBtnsRenderUI;
         viewClassMap["game.ui.commons.icons.PlayerRenderS3UI"] = PlayerRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
