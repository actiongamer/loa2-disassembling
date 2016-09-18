package game.ui.lotteryHeroModules.results
{
   import morn.customs.components.PanelView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.SkillRenderS2UI;
   
   public class ResultOneUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="236" height="200">
			  <PanelBgS3 x="0" y="0" showImgTitle2="false" width="230" height="200"/>
			  <Image skin="png.uiRoleInfo.坦克型" var="img_group" autoSize="true" width="43" height="50" x="44" y="25"/>
			  <Label text="女神一号 +8" autoSize="none" y="29" width="121" height="19" size="14" var="txt_name" color="0xc04af1" align="left" bold="false" letterSpacing="1" isHtml="true" x="99"/>
			  <Label text="输出型" autoSize="none" y="56" width="64" height="22" size="12" var="txt_type" color="0xc04af1" align="center" bold="false" letterSpacing="1" isHtml="true" x="98"/>
			  <List x="32" y="101" repeatX="3" spaceX="6" var="list_skill">
			    <SkillRenderS2 name="render" runtime="game.ui.commons.icons.SkillRenderS2UI"/>
			  </List>
			  <Label text="详细信息" autoSize="none" y="163" width="64" height="22" size="12" var="txt_more" color="0x38ff1b" align="center" bold="false" isHtml="true" x="144" underline="true"/>
			</PanelView>;
       
      
      public var img_group:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_type:Label = null;
      
      public var list_skill:List = null;
      
      public var txt_more:Label = null;
      
      public function ResultOneUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS2UI"] = SkillRenderS2UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
