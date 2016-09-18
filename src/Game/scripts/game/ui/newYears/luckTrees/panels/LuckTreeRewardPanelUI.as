package game.ui.newYears.luckTrees.panels
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.newYears.luckTrees.renders.PersonScoreRenderUI;
   
   public class LuckTreeRewardPanelUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <Image skin="png.uiLuckTree.personScore.img_bg" x="257" y="83" width="532" height="370"/>
			  <Image skin="png.uiLuckTree.personShop.img_avatar" x="-204" y="-180"/>
			  <List x="262" y="120" var="list_gift" repeatY="6" spaceY="4" width="514" height="326">
			    <PersonScoreRender name="render" runtime="game.ui.newYears.luckTrees.renders.PersonScoreRenderUI"/>
			  </List>
			  <Label text="LV" autoSize="none" x="270" y="95" style="加底标题" width="119" align="center" var="txt_list_title_lv" height="20"/>
			  <Label text="Reward" autoSize="none" x="411" y="95" style="加底标题" width="159" align="center" var="txt_list_title_reward" height="20"/>
			  <Label text="Option" autoSize="none" x="583" y="95" style="加底标题" width="159" align="center" var="txt_list_title_option" height="20"/>
			  <Label text="Date Time CD" autoSize="none" x="240" y="3" style="普通说明" width="512" height="19" var="txt_cd" align="right"/>
			  <Label text="Score" autoSize="none" x="655" y="29" style="小标题" width="107" height="19" var="txt_score"/>
			  <Image skin="png.a5.comps.img_block" x="632" y="27" width="20" height="20" var="img_icon_score"/>
			  <Image skin="png.uiLuckTree.personScore.img_line" x="272" y="118"/>
			</View>;
       
      
      public var list_gift:List = null;
      
      public var txt_list_title_lv:Label = null;
      
      public var txt_list_title_reward:Label = null;
      
      public var txt_list_title_option:Label = null;
      
      public var txt_cd:Label = null;
      
      public var txt_score:Label = null;
      
      public var img_icon_score:Image = null;
      
      public function LuckTreeRewardPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.luckTrees.renders.PersonScoreRenderUI"] = PersonScoreRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
