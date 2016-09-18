package game.ui.newYears.charmStar.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import game.ui.commons.icons.PlayerRenderS3UI;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class CharmRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="749" height="60">
			  <Image skin="png.uiCharmStar.rank1" x="0" y="9" var="img_rank"/>
			  <Label text="杰克斯，汉克" autoSize="none" x="129" y="45" style="普通说明" width="123" align="center" size="11" var="label_name" height="20"/>
			  <Label text="送鲜花" autoSize="none" x="609" y="40" style="普通说明" width="98" align="center" var="txt_tip1" height="20"/>
			  <Image skin="png.uiCharmStar.img_line" x="4" y="59"/>
			  <ClipList value="739" clipWidth="14" align="center" url="png.a5.comps.clipList.clipList_S15" x="77" y="30" var="clip"/>
			  <PlayerRenderS3 x="170" y="5" scale="0.5" var="renderHero" runtime="game.ui.commons.icons.PlayerRenderS3UI"/>
			  <Box x="275" y="5">
			    <List y="1" repeatX="1" spaceX="9" var="list_reward" centerX="0">
			      <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			    </List>
			    <Button skin="png.uiCharmStar.img_choco" x="353" stateNum="1" var="btn_send"/>
			    <Label text="520" autoSize="none" y="16" style="渐变1" width="86" align="center" height="26" var="label_pop"/>
			  </Box>
			</View>;
       
      
      public var img_rank:Image = null;
      
      public var label_name:Label = null;
      
      public var txt_tip1:Label = null;
      
      public var clip:ClipList = null;
      
      public var renderHero:PlayerRenderS3UI = null;
      
      public var list_reward:List = null;
      
      public var btn_send:Button = null;
      
      public var label_pop:Label = null;
      
      public function CharmRankRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.PlayerRenderS3UI"] = PlayerRenderS3UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
