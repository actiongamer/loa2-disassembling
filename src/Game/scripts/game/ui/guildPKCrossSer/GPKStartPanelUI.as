package game.ui.guildPKCrossSer
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   
   public class GPKStartPanelUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="806" height="550">
			  <PanelBg x="0" y="0" width="806" height="550"/>
			  <Image skin="png.comp.image" x="15" y="36" width="776" height="502" var="img_bg1"/>
			  <Image skin="png.comp.image" x="24" y="45" width="251" height="347" var="img_bg2"/>
			  <Image skin="png.uiGuildPKCrossSer.img_challenge1" x="26" y="205"/>
			  <Label text="普通说明" autoSize="none" x="59" y="275" style="普通说明" width="183" height="105" var="txt_me_info" leading="5"/>
			  <Label text="升级后加底标题" autoSize="none" x="25" y="234" style="升级后加底标题" width="247" height="20" align="center" var="txt_me_name"/>
			  <Image skin="png.comp.image" x="145" y="142" var="img_flag_bg" anchorX=".5" anchorY=".5"/>
			  <Image skin="png.comp.image" x="149" y="128" anchorX=".5" anchorY=".5" var="img_flag_icon"/>
			  <List x="291" y="55" repeatY="3" spaceY="0" var="list_enemy">
			    <GPKChallengeRender name="render" runtime="game.ui.guildPKCrossSer.GPKChallengeRenderUI"/>
			  </List>
			  <Label text="加底标题" autoSize="none" x="34" y="425" style="加底标题" width="226" height="20" align="center" var="txt_fight_times"/>
			  <Button label="\l30610021" x="87.5" style="按钮大绿" y="470" var="btn_change"/>
			  <PageBarS2 x="468" y="498" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			</PopModuleView>;
       
      
      public var img_bg1:Image = null;
      
      public var img_bg2:Image = null;
      
      public var txt_me_info:Label = null;
      
      public var txt_me_name:Label = null;
      
      public var img_flag_bg:Image = null;
      
      public var img_flag_icon:Image = null;
      
      public var list_enemy:List = null;
      
      public var txt_fight_times:Label = null;
      
      public var btn_change:Button = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public function GPKStartPanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.guildPKCrossSer.GPKChallengeRenderUI"] = GPKChallengeRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
