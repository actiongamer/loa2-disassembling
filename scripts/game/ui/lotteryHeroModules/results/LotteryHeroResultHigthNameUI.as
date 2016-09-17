package game.ui.lotteryHeroModules.results
{
   import morn.customs.components.FadeView;
   import game.ui.commons.comps.others.ClickToNextUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import game.ui.commons.icons.PlayerTitleRenderUI;
   import morn.core.components.List;
   import game.ui.lotteryHeroModules.ClickToNextButtonTimeUI;
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   import game.ui.commons.icons.SkillRenderS2UI;
   
   public class LotteryHeroResultHigthNameUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="600">
			  <ClickToNext x="230" y="546" var="clickToNextUI" runtime="game.ui.commons.comps.others.ClickToNextUI"/>
			  <Box x="66" y="485" var="box_promptBottom">
			    <Image skin="png.uiLottery.style4.恭喜获得" x="132" centerX="0"/>
			    <Label text="获得x色英雄" autoSize="none" y="13" width="468" size="16" color="0xffe1a2" var="txt_heroQuality" centerX="0" align="center" height="44" isHtml="true"/>
			  </Box>
			  <PlayerTitleRender x="157" y="-24" centerX="0" var="box_heroName" runtime="game.ui.commons.icons.PlayerTitleRenderUI"/>
			  <List x="474" y="189" var="list_skill" repeatY="4" spaceY="4" centerX="220">
			    <SkillRenderS2 name="render" runtime="game.ui.commons.icons.SkillRenderS2UI"/>
			  </List>
			  <Label text="\l11300000" autoSize="none" height="87" width="396" align="center" style="普通说明" size="14" x="102" y="18" var="txt_des" wordWrap="true" color="0x00ff00" isHtml="true"/>
			  <ClickToNextButtonTime x="196.5" y="546" var="clickToNextButtonTimeUI" runtime="game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"/>
			  <BtnFaceBook x="433" y="533" var="faceBookView" visible="false" runtime="game.ui.commons.comps.btns.BtnFaceBookUI"/>
			</FadeView>;
       
      
      public var clickToNextUI:ClickToNextUI = null;
      
      public var box_promptBottom:Box = null;
      
      public var txt_heroQuality:Label = null;
      
      public var box_heroName:PlayerTitleRenderUI = null;
      
      public var list_skill:List = null;
      
      public var txt_des:Label = null;
      
      public var clickToNextButtonTimeUI:ClickToNextButtonTimeUI = null;
      
      public var faceBookView:BtnFaceBookUI = null;
      
      public function LotteryHeroResultHigthNameUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnFaceBookUI"] = BtnFaceBookUI;
         viewClassMap["game.ui.commons.comps.others.ClickToNextUI"] = ClickToNextUI;
         viewClassMap["game.ui.commons.icons.PlayerTitleRenderUI"] = PlayerTitleRenderUI;
         viewClassMap["game.ui.commons.icons.SkillRenderS2UI"] = SkillRenderS2UI;
         viewClassMap["game.ui.lotteryHeroModules.ClickToNextButtonTimeUI"] = ClickToNextButtonTimeUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
